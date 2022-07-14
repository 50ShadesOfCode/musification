import 'dart:convert';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/dio.dart';

class LastFMProvider {
  final HttpClient _client;

  LastFMProvider({
    required HttpClient client,
  }) : _client = client;
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    final UserCredentials credentials = UserCredentials(
      username: username,
      password: password,
    );
    final dynamic response = await _client.authorizedPost(
      'auth.getMobileSession',
      parameters: credentials.toJson(),
    );

    print(response);

    return Session.fromXml(response as String).sessionKey;
  }

  Future<List<Song>> getTopTracks() async {
    final Map<String, dynamic> response = await _client.get(
      'chart.gettoptracks',
      parameters: <String, dynamic>{'limit': 100},
    );
    final List<dynamic> tracks = response['tracks']['track'] as List<dynamic>;
    return List<Song>.generate(
      tracks.length,
      (int index) => Song.fromJson(tracks[index] as Map<String, dynamic>),
    );
  }
}
