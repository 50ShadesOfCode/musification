import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';

class PrefsRepositoryImpl extends PrefsRepository {
  final PrefsProvider _prefsProvider;

  const PrefsRepositoryImpl({
    required PrefsProvider prefsProvider,
  }) : _prefsProvider = prefsProvider;

  @override
  Future<void> setPreferredGenres(List<String> preferred) async {
    await _prefsProvider.setPreferredGenres(preferred);
  }

  @override
  List<String> getPreferredGenres() {
    return _prefsProvider.getPreferredGenres();
  }
}
