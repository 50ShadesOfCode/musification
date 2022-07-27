import 'package:discover/player/player_screen.dart';
import 'package:flutter/material.dart';

class PlayerPage extends Page<dynamic> {
  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => PlayerScreen(),
    );
  }
}
