import 'dart:async';

import 'package:authorization/authorization_feature.dart';
import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/onboarding/onboarding.dart';
import 'package:fpmi_music_band/feature/preferences/preferences.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'splash_event.dart';
import 'splash_state.dart';

export 'splash_event.dart';
export 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required AppRouter appRouter,
    required IsFirstLaunchUseCase isFirstLaunchUseCase,
    required IsUserAuthorizedUseCase isUserAuthorizedUseCase,
    required GetPreferredUseCase getPreferredUseCase,
  })  : _appRouter = appRouter,
        _isFirstLaunchUseCase = isFirstLaunchUseCase,
        _isUserAuthorizedUseCase = isUserAuthorizedUseCase,
        _getPreferredUseCase = getPreferredUseCase,
        super(SplashInitial()) {
    on<InitEvent>(_onInitEvent);
    on<AppStarted>(_onStartedEvent);
  }
  final GetPreferredUseCase _getPreferredUseCase;
  final AppRouter _appRouter;
  final IsFirstLaunchUseCase _isFirstLaunchUseCase;
  final IsUserAuthorizedUseCase _isUserAuthorizedUseCase;

  Future<void> _onInitEvent(InitEvent event, Emitter<SplashState> emit) async {}

  Future<void> _onStartedEvent(
      AppStarted event, Emitter<SplashState> emit) async {
    if (_isFirstLaunchUseCase.execute(NoParams())) {
      _appRouter.replace(Onboarding.page());
      emit(state);
      return;
    }
    if (_isUserAuthorizedUseCase.execute(NoParams())) {
      if (_getPreferredUseCase.execute(NoParams()).isEmpty) {
        _appRouter.replace(PreferencesFeature.page());
        emit(state);
        return;
      } else {
        _appRouter.replace(Home.page);
        emit(state);
        return;
      }
    }
    if (!_isUserAuthorizedUseCase.execute(NoParams())) {
      _appRouter.replace(AuthFeature.page());
      emit(state);
    }
  }
}
