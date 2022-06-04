import 'dart:convert';
import 'dart:typed_data';

import 'package:data/src/lastfm/lastfm.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/crypto.dart';
import 'package:shared_dependencies/utils.dart';

/// It helps generating a session key.
///
///  A session key's lifetime is infinite, unless the user revokes the rights
///  of the given API Key.
class SessionKeyGenerator {
  final LastFM _api;

  SessionKeyGenerator(this._api);

  /// It generates a SessionKey from a [username] and a [passwordHash].
  /// It uses [auth.getMobileSession]
  ///
  /// [auth.getMobileSession]: https://www.last.fm/api/show/auth.getMobileSession
  Future<Session> getSessionKey(
      {required String username, required String passwordHash}) async {
    final Map<String, String> parameters = <String, String>{
      'username': username,
      'authToken': generateMD5(username + passwordHash)
    };

    final Request request = Request(
        api: _api, method: 'auth.getMobileSession', parameters: parameters);

    request.signRequest();

    final dynamic response = await request.send(mode: RequestMode.GET);

    return Session.fromJson(response['session'] as Map<String, dynamic>);
  }
}

String generateMD5(String value) {
  final Uint8List content = const Utf8Encoder().convert(value);
  final Digest digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
