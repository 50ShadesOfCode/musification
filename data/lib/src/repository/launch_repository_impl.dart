import 'package:data/src/prefs/prefs_provider.dart';
import 'package:domain/domain.dart';

class LaunchRepositoryImpl extends LaunchRepository {
  final PrefsProvider _prefsProvider;

  const LaunchRepositoryImpl({required PrefsProvider prefsProvider})
      : _prefsProvider = prefsProvider;

  @override
  bool isFirstLaunch() => _prefsProvider.isFirstLaunch();

  @override
  Future<void> firstLaunch() => _prefsProvider.firstLaunch();
}
