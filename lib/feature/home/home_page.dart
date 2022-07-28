import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/home/home_bloc/home_bloc.dart';
import 'package:fpmi_music_band/feature/home/home_form.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

class HomePage extends Page<void> {
  @override
  String get name => Home.routeName;

  @override
  LocalKey get key => const ValueKey<String>(Home.routeName);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(
              appRouter: appLocator.get<AppRouter>(),
            ),
          ),
          BlocProvider<PlayerBloc>(
            create: (BuildContext context) => PlayerBloc(
              audioProvider: appLocator.get<AudioProvider>(),
              appRouter: appLocator.get<AppRouter>(),
            )..add(InitEvent()),
          )
        ],
        child: HomeForm(),
      ),
    );
  }
}
