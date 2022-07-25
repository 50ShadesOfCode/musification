import 'package:shared_dependencies/sharedprefs.dart';

class PrefsProvider {
  late SharedPreferences _sharedPreferences;

  static const String _keyIsFirstLaunch = 'isFirstLaunch';

  static const String _keySessionKey = 'sessionKey';

  static const String _keyPreferredGenres = 'preferredGenres';

  static const String _keySearchHistory = 'searchHistory';

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

  Future<void> setPreferredGenres(List<String> preferred) async {
    await _sharedPreferences.setStringList(_keyPreferredGenres, preferred);
  }

  List<String> getPreferredGenres() {
    return _sharedPreferences.getStringList(_keyPreferredGenres) ?? <String>[];
  }

  Future<void> setSearchHistory(List<String> history) async {
    _sharedPreferences.setStringList(_keySearchHistory, history);
  }

  List<String> getSearchHistory() {
    return _sharedPreferences.getStringList(_keySearchHistory) ?? <String>[];
  }
}
