import 'package:shared_dependencies/sharedprefs.dart';

class PrefsProvider {
  late SharedPreferences _sharedPreferences;

  static const String _keyIsFirstLaunch = 'isFirstLaunch';

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> firstLaunch() async {
    await _sharedPreferences.setBool(_keyIsFirstLaunch, false);
  }

  bool isFirstLaunch() {
    final bool? isFirst = _sharedPreferences.getBool(_keyIsFirstLaunch);
    return isFirst ?? true;
  }
}
