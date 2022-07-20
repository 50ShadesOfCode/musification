import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/preferences/bloc/preferences_bloc.dart';
import 'package:fpmi_music_band/feature/preferences/preferences_form.dart';
import 'package:fpmi_music_band/router/page_with_scaffold_key.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

class PreferencesPage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => BlocProvider<PreferencesBloc>(
          create: (_) => PreferencesBloc(
            appRouter: appLocator.get<AppRouter>(),
            setPreferredUseCase: appLocator.get<SetPreferredUseCase>(),
          ),
          child: SafeArea(
              child: ScaffoldMessenger(
            key: scaffoldKey,
            child: PreferencesForm(),
          )),
        ),
      );
}
