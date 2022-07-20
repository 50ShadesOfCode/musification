import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appDI.initDependencies();
  await dataDI.initDependencies();
  runApp(const Application());
}
