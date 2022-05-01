import 'package:core/core.dart';
import 'package:data/src/prefs/prefs_provider.dart';
import 'package:data/src/repository/launch_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await initPrefs();
    appLocator
        .registerLazySingleton<LaunchRepository>(() => LaunchRepositoryImpl(
              prefsProvider: appLocator.get<PrefsProvider>(),
            ));
    appLocator.registerFactory<IsFirstLaunchUseCase>(
      () => IsFirstLaunchUseCase(
        launchRepository: appLocator.get<LaunchRepository>(),
      ),
    );

    appLocator.registerFactory<FirstLaunchUseCase>(
      () => FirstLaunchUseCase(
        launchRepository: appLocator.get<LaunchRepository>(),
      ),
    );
  }

  Future<void> initPrefs() async {
    final PrefsProvider prefsProvider = PrefsProvider();

    await Future.wait(
        <Future<void>>[prefsProvider.initializeSharedPreferences()]);

    appLocator.registerSingleton<PrefsProvider>(
      prefsProvider,
    );
  }
}
