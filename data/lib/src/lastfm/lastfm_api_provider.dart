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
    final dynamic response = await _client.post(
      'auth.getMobileSession',
      parameters: credentials.toJson(),
    );

    print(response);

    return Session.fromXml(response as String).sessionKey;
  }
}
