import 'package:data/data.dart';
import 'package:domain/domain.dart';

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

  Future<List<Song>> getRecommendedTracks(List<String> genres) async {
    List<Song> result = <Song>[];
    List<List<dynamic>> response = <List<dynamic>>[];

    for (final String genre in genres) {
      response.add(
        (await _client.get(
          'tag.gettoptracks',
          parameters: <String, dynamic>{
            'tag': genre,
          },
        ))['tracks']['track'] as List<dynamic>,
      );
    }
    for (final List<dynamic> songList in response) {
      for (int i = 0; i < 50; i++) {
        result.add(Song.fromJson(songList[i] as Map<String, dynamic>));
      }
    }
    return result;
  }
}
