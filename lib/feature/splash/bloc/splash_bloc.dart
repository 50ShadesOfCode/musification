import 'dart:async';

import 'package:authorization/authorization_feature.dart';
import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/onboarding/onboarding.dart';
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
    required SetFirstLaunchUseCase setFirstLaunchUseCase,
    required IsUserAuthorizedUseCase isUserAuthorizedUseCase,
  })  : _appRouter = appRouter,
        _isFirstLaunchUseCase = isFirstLaunchUseCase,
        _setFirstLaunchUseCase = setFirstLaunchUseCase,
        _isUserAuthorizedUseCase = isUserAuthorizedUseCase,
        super(SplashInitial()) {
    on<InitEvent>(_onInitEvent);
    on<AppStarted>(_onStartedEvent);
  }

  final AppRouter _appRouter;
  final IsFirstLaunchUseCase _isFirstLaunchUseCase;
  final IsUserAuthorizedUseCase _isUserAuthorizedUseCase;
  final SetFirstLaunchUseCase _setFirstLaunchUseCase;

  Future<void> _onInitEvent(InitEvent event, Emitter<SplashState> emit) async {}

  Future<void> _onStartedEvent(
      AppStarted event, Emitter<SplashState> emit) async {
    if (_isFirstLaunchUseCase.execute(NoParams())) {
      _setFirstLaunchUseCase.execute(NoParams());
      _appRouter.replace(Onboarding.page());
      emit(state);
    }
    if (_isUserAuthorizedUseCase.execute(NoParams())) {
      _appRouter.replace(Home.page);
      emit(state);
    }
    if (!_isUserAuthorizedUseCase.execute(NoParams())) {
      _appRouter.replace(AuthFeature.page());
      emit(state);
    }
  }
}
