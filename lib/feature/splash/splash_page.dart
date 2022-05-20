import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/splash/splash_form.dart';
import 'package:fpmi_music_band/router/page_with_scaffold_key.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'bloc/splash_bloc.dart';


class SplashPage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<SplashBloc>(
          create: (_) => SplashBloc(
            appRouter: appLocator.get<AppRouter>(),
            firstLaunchUseCase: appLocator.get<IsFirstLaunchUseCase>(),
            setFirstLaunchUseCase: appLocator.get<SetFirstLaunchUseCase>(),
          )..add(InitEvent()),
          child: SafeArea(
            child: ScaffoldMessenger(
              key: scaffoldKey,
              child: const SplashForm(),
            ),
          ),
        ),
      );
}