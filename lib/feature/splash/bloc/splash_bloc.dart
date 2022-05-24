import 'dart:async';

import 'package:authorization/authorization_feature.dart';
import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/onboarding/onboarding.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'splash_event.dart';
import 'splash_state.dart';

export 'splash_event.dart';
export 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;
  final IsFirstLaunchUseCase _firstLaunchUseCase;
  final SetFirstLaunchUseCase _setFirstLaunchUseCase;

  SplashBloc({
    required AppRouter appRouter,
    required IsFirstLaunchUseCase firstLaunchUseCase,
    required SetFirstLaunchUseCase setFirstLaunchUseCase,
  })  : _appRouter = appRouter,
        _firstLaunchUseCase = firstLaunchUseCase,
        _setFirstLaunchUseCase = setFirstLaunchUseCase,
        super(SplashInitial()) {
    on<InitEvent>(_onInitEvent);
    on<AppStarted>(_onStartedEvent);
  }

  Future<void> _onInitEvent (
      SplashEvent event, Emitter<SplashState> emit) async {
  }

  Future<void> _onStartedEvent (
      SplashEvent event, Emitter<SplashState> emit) async {
    if (_firstLaunchUseCase.execute(NoParams())) {
      _setFirstLaunchUseCase.execute(NoParams());
      _appRouter.replace(Onboarding.page());
    } else {
      _appRouter.replace(AuthFeature.page());
    } // TODO: Add usecase for auth
  }
}