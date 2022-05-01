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
        super(OnboardingInitial());

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is SkipEvent) {
      _appRouter.replace(Home.page);
    }
  }
}
