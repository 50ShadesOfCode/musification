import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/lastfm/lastfm_api_provider.dart';
import 'package:data/src/prefs/prefs_provider.dart';
import 'package:data/src/repository/auth_repository_impl.dart';
import 'package:data/src/repository/launch_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    await initPrefs();
    appLocator.registerSingleton<HttpClient>(
      HttpClient(
          prefsProvider: appLocator.get<PrefsProvider>(),
          baseUrl: 'http://ws.audioscrobbler.com/2.0/'),
    );
    appLocator.registerSingleton<LastFMProvider>(
      LastFMProvider(
        client: appLocator.get<HttpClient>(),
      ),
    );
    appLocator.registerLazySingleton<LaunchRepository>(
      () => LaunchRepositoryImpl(
        prefsProvider: appLocator.get<PrefsProvider>(),
      ),
    );
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        apiProvider: appLocator.get<LastFMProvider>(),
        prefsProvider: appLocator.get<PrefsProvider>(),
      ),
    );
    appLocator.registerFactory<IsFirstLaunchUseCase>(
      () => IsFirstLaunchUseCase(
        launchRepository: appLocator.get<LaunchRepository>(),
      ),
    );

    appLocator.registerFactory<SignInUseCase>(
      () => SignInUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerFactory<IsUserAuthorizedUseCase>(
      () => IsUserAuthorizedUseCase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );

    appLocator.registerFactory<SetFirstLaunchUseCase>(
      () => SetFirstLaunchUseCase(
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
