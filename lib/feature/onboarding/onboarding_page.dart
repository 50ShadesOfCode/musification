import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:fpmi_music_band/feature/onboarding/onboarding_form.dart';
import 'package:fpmi_music_band/router/page_with_scaffold_key.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

class OnboardingPage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<OnboardingBloc>(
          create: (_) => OnboardingBloc(
            appRouter: appLocator.get<AppRouter>(),
          ),
          child: SafeArea(
            child: ScaffoldMessenger(
              key: scaffoldKey,
              child: OnboardingForm(),
            ),
          ),
        ),
      );
}
