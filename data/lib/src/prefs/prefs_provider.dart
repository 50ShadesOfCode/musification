import 'package:shared_dependencies/sharedprefs.dart';

class PrefsProvider {
  late SharedPreferences _sharedPreferences;

  static const String _keyIsFirstLaunch = 'isFirstLaunch';

  static const String _keySessionKey = 'sessionKey';

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setFirstLaunch() async {
    await _sharedPreferences.setBool(_keyIsFirstLaunch, false);
  }

  bool isFirstLaunch() {
    final bool? isFirst = _sharedPreferences.getBool(_keyIsFirstLaunch);
    return isFirst ?? true;
  }

  Future<void> setSessionKey(String sessionKey) async {
    await _sharedPreferences.setString(_keySessionKey, sessionKey);
  }

  String getSessionKey() {
    final String? sessionKey = _sharedPreferences.getString(_keySessionKey);
    return sessionKey ?? '';
  }
}
