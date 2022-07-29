import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/src/lastfm/lastfm_api_provider.dart';
import 'package:data/src/prefs/prefs_provider.dart';
import 'package:data/src/repository/auth_repository_impl.dart';
import 'package:data/src/repository/launch_repository_impl.dart';
import 'package:data/src/repository/prefs_repository_impl.dart';
import 'package:data/src/repository/track_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:just_audio/just_audio.dart';

final DataDI dataDI = DataDI();

class DataDI {
  static const String _base_url = 'http://ws.audioscrobbler.com/2.0/';

  Future<void> initDependencies() async {
    await initPrefs();
    appLocator.registerSingleton<HttpClient>(
      HttpClient(
        baseUrl: _base_url,
      ),
    );
    appLocator.registerSingleton<AudioProvider>(
      AudioProvider(
        audioPlayer: AudioPlayer(),
      ),
    );
    appLocator.registerSingleton<LastFMProvider>(
      LastFMProvider(
        client: appLocator.get<HttpClient>(),
      ),
    );
    appLocator.registerLazySingleton<TrackRepository>(
      () => TrackRepositoryImpl(
        apiProvider: appLocator.get<LastFMProvider>(),
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
    appLocator.registerLazySingleton<PrefsRepository>(
      () => PrefsRepositoryImpl(
        prefsProvider: appLocator.get<PrefsProvider>(),
      ),
    );
    appLocator.registerFactory<GetSearchHistoryUseCase>(
      () => GetSearchHistoryUseCase(
        prefsRepository: appLocator.get<PrefsRepository>(),
      ),
    );
    appLocator.registerFactory<SetSearchHistoryUseCase>(
      () => SetSearchHistoryUseCase(
        prefsRepository: appLocator.get<PrefsRepository>(),
      ),
    );
    appLocator.registerFactory<GetRecommendedTracksUseCase>(
      () => GetRecommendedTracksUseCase(
        trackRepository: appLocator.get<TrackRepository>(),
      ),
    );
    appLocator.registerFactory<GetTopTracksUseCase>(
      () => GetTopTracksUseCase(
        trackRepository: appLocator.get<TrackRepository>(),
      ),
    );
    appLocator.registerFactory<GetPreferredGenresUseCase>(
      () => GetPreferredGenresUseCase(
        prefsRepository: appLocator.get<PrefsRepository>(),
      ),
    );
    appLocator.registerFactory<SetPreferredUseCase>(
      () => SetPreferredUseCase(
        prefsRepository: appLocator.get<PrefsRepository>(),
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
