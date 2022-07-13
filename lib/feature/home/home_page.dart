import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/bloc/home_bloc.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/home/home_form.dart';
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
      builder: (BuildContext context) => BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(
          appRouter: appLocator.get<AppRouter>(),
        ),
        child: HomeForm(),
      ),
    );
  }
}
