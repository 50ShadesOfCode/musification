import 'dart:convert';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/crypto.dart';
import 'package:shared_dependencies/utils.dart';

class LastFMProvider {
  final HttpClient _client;

  LastFMProvider({
    required HttpClient client,
  }) : _client = client;

  Future<String> authenticate(
      {required String username, required String passwordHash}) async {
    final Map<String, String> parameters = <String, String>{
      'username': username,
      'authToken': generateMD5(username + passwordHash)
    };

    final dynamic response =
        await _client.get('auth.getMobileSession', parameters: parameters);

    return Session.fromJson(response['session'] as Map<String, dynamic>)
        .sessionKey;
  }
}

String generateMD5(String value) {
  final Uint8List content = const Utf8Encoder().convert(value);
  final Digest digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
