import 'package:data/src/lastfm/lastfm.dart';
import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  final PrefsProvider _prefsProvider;

  const AuthRepositoryImpl({required PrefsProvider prefsProvider})
      : _prefsProvider = prefsProvider;

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
  Future<void> resetSession() {
    // TODO: implement resetSession
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String username, String password) async {
    final LastFM lastFMAuth =
        await LastFM.authenticate(username: username, password: password);
    _prefsProvider.setSessionKey(lastFMAuth.sessionKey ?? '');
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
