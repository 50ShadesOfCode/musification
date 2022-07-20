import 'package:data/src/lastfm/lastfm_api_provider.dart';
import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final PrefsProvider _prefsProvider;
  final LastFMProvider _apiProvider;

  const AuthRepositoryImpl(
      {required PrefsProvider prefsProvider,
      required LastFMProvider apiProvider})
      : _prefsProvider = prefsProvider,
        _apiProvider = apiProvider;

  @override
  bool isAuthorized() {
    return _prefsProvider.getSessionKey() == '' ? false : true;
  }

  @override
  Stream<AuthorizationEvents> observe() {
    // TODO: implement observe
    throw UnimplementedError();
  }

  @override
  Future<void> resetSession() async {
    await _prefsProvider.setSessionKey('');
  }

  @override
  Future<void> signIn(String username, String password) async {
    final String sessionKey = await _apiProvider.authenticate(
      username: username,
      password: password,
    );
    _prefsProvider.setSessionKey(sessionKey);
  }

  @override
  Future<void> signOut() async {
    _prefsProvider.setSessionKey('');
  }
}
