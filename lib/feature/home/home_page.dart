import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/home.dart';

class HomePage extends Page<void> {
  @override
  String get name => Home.routeName;

  @override
  LocalKey get key => const ValueKey<String>(Home.routeName);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => Scaffold(
        body: Center(
          child: Text(
            'Home',
            style: AppFonts.sfUi24bold.copyWith(
              color: AppTheme.activeColor,
            ),
          ),
        ),
      ),
    );
  }
}
