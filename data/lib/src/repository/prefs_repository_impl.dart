import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';

class PrefsRepositoryImpl extends PrefsRepository {
  final PrefsProvider _prefsProvider;

  const PrefsRepositoryImpl({
    required PrefsProvider prefsProvider,
  }) : _prefsProvider = prefsProvider;

  @override
  Future<void> setPreferredGenres(List<String> preferred) async {
    _prefsProvider.setPreferredGenres(preferred);
  }

  @override
  List<String> getPreferredGenres() {
    return _prefsProvider.getPreferredGenres();
  }

  @override
  Future<void> setSearchHistory(List<String> history) async {
    _prefsProvider.setSearchHistory(history);
  }

  @override
  List<String> getSearchHistory() {
    return _prefsProvider.getSearchHistory();
  }
}
