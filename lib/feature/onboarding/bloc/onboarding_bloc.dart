import 'package:fpmi_music_band/feature/home_page.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

export 'onboarding_event.dart';
export 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final AppRouter _appRouter;

  OnboardingBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const OnboardingState(index: 0)) {
    on<AddEvent>(_onAddEvent);
    on<SkipEvent>(_onSkipEvent);
  }

  Future<void> _onAddEvent(
      OnboardingEvent event, Emitter<OnboardingState> emit) async {
    if (state.index == 2) {
      //TODO : Set to login
      _appRouter.replace(Home.page);
      emit(state);
    } else {
      emit(state.copyWith(index: state.index + 1));
    }
  }

  Future<void> _onSkipEvent(
      OnboardingEvent event, Emitter<OnboardingState> emit) async {
    //TODO : Set to login
    _appRouter.replace(Home.page);
    emit(state);
  }
}
