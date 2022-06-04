import 'dart:convert';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:shared_dependencies/crypto.dart';
import 'package:shared_dependencies/utils.dart';

enum RequestMode {
  GET,
  POST,
}

/// It's creates a request object for the method.
class Request {
  final LastFM _api;
  final Map<String, dynamic> _parameters;

  Request({
    required LastFM api,
    required String method,
    Map<String, dynamic>? parameters,
  })  : _api = api,
        _parameters = {} {
    parameters?.forEach((String key, dynamic value) {
      if (value != null) {
        _parameters[key] = formatUnicode(text: value);
      }
    });

    _parameters['api_key'] = _api.apiKey;
    _parameters['method'] = method;

    if (_api.sessionKey != null) {
      _parameters['sk'] = _api.sessionKey;
      signRequest();
    }
  }

  /// It signs the [Request].
  void signRequest() {
    if (!_parameters.containsKey('api_sig')) {
      _parameters['api_sig'] = _getSignature();
    }
  }

  /// It generates a signature.
  String _getSignature() {
    String signature = '';
    final List<String> sortedKeys = _parameters.keys.toList()..sort();

    for (final String key in sortedKeys) {
      signature += key;
      signature += _parameters[key] as String;
    }

    signature += _api.apiSecret;

    return generateMD5(signature);
  }

  /// It sends the request to the API.
  Future<dynamic> send({required RequestMode mode}) async {
    switch (mode) {
      case RequestMode.GET:
        return await _api.client.get(parameters: _parameters);
      case RequestMode.POST:
        return await _api.client.post(parameters: _parameters);
    }
  }
}

String formatUnicode({@required dynamic text}) {
  if (text is List<int>) {
    return utf8.decode(text);
  } else if (text is String) {
    return utf8.decode(utf8.encode(text));
  } else {
    return text.toString();
  }
}

String generateMD5(String value) {
  final Uint8List content = const Utf8Encoder().convert(value);
  final Digest digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
