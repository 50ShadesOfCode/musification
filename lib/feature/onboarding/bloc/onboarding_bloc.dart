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
    on<AddEvent>((OnboardingEvent event, Emitter<OnboardingState> emit) {
      if (state.index == 3) {
        _appRouter.replace(Home.page);
        emit(state);
      } else {
        emit(state.copyWith(index: state.index + 1));
      }
    });
    on<SkipEvent>((OnboardingEvent event, Emitter<OnboardingState> emit) {
      _appRouter.replace(Home.page);
      emit(state);
    });
    on<InitEvent>((OnboardingEvent event, Emitter<OnboardingState> emit) {
      emit(const OnboardingState(index: 0));
    });
  }
}
