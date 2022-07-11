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
  //TODO : Add case for wrong credits
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    final UserCredentials credentials = UserCredentials(
      username: username,
      password: password,
    );
    final dynamic response = await _client.post(
      'auth.getMobileSession',
      parameters: credentials.toJson(),
    );

    print(response);

    return Session.fromXml(response as String).sessionKey;
  }
}
