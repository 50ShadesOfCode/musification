import 'package:flutter/material.dart';
import 'package:fpmi_music_band/router/page_with_scaffold_key.dart';

class ConnectionErrorPage extends PageWithScaffoldKey<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) =>
      MaterialPageRoute<dynamic>(
        settings: this,
        builder: (BuildContext context) => SafeArea(
          child: ScaffoldMessenger(
            key: scaffoldKey,
            child: const Scaffold(
              body: Center(
                child: Text(
                    'Connection Error. Please check your internet connection!'),
              ),
            ),
          ),
        ),
      );
}
