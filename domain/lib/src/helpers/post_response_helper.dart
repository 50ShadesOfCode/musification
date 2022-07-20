import 'package:domain/domain.dart';
import 'package:shared_dependencies/xml.dart';

/// It helps getting a object from a Response of [SpaceShip].
class PostResponseHelper {
  /// The response status of a POST Response.
  final bool _status;

  PostResponseHelper._(this._status);

  factory PostResponseHelper.parse(String response) {
    final XmlNode statusNode =
        XmlDocument.parse(response).findElements('lfm').first;

    if (statusNode.getAttribute('status') == 'ok') {
      return PostResponseHelper._(true);
    } else if (statusNode.getAttribute('status') == 'failed') {
      return PostResponseHelper._(false);
    } else {
      throw AppException('Response unrecognized.');
    }
  }

  /// It returns the status of a POST Response.
  bool get status => _status;
}
