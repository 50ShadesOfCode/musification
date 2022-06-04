import 'package:shared_dependencies/dio.dart';
import 'package:shared_dependencies/utils.dart';

class LastFMException extends DioError {
  final int _errorCode;
  final String _description;

  LastFMException._({required int errorCode, required String description})
      : _errorCode = errorCode,
        _description = description,
        super(requestOptions: RequestOptions(path: ''));

  LastFMException({required String errorCode, required String description})
      : this._(errorCode: int.parse(errorCode), description: description);

  factory LastFMException.generate(dynamic errorObject) {
    if (isXml(errorObject.toString())) {
      // Is a XML
      final XmlDocument xmlError = XmlDocument.parse(errorObject as String);

      final XmlNode failedNode = xmlError.children.firstWhere(
          (XmlNode xmlNode) => xmlNode.getAttribute('status') == 'failed');

      // Needed because lastFM is inconsistent even in errors...
      final XmlNode errorNode = failedNode.children.firstWhere(
          (XmlNode xmlNode) => xmlNode.getAttribute('code') != null);

      return LastFMException(
          errorCode: errorNode.getAttribute('code')!,
          description: errorNode.text);
    } else {
      // Else is a Json...
      return LastFMException(
          errorCode: errorObject['error'].toString(),
          description: errorObject['message'] as String);
    }
  }

  @override
  String toString() => '[LastFMException] => [Code $_errorCode]: $_description';
}

bool isXml(dynamic object) {
  if (object.toString().startsWith('<')) {
    return true;
  }
  return false;
}
