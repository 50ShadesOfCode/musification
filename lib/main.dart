import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDI.initDependencies();
  runApp(const Application());
}