import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/application.dart';
import 'package:shared_dependencies/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  appDI.initDependencies();
  await dataDI.initDependencies();
  runApp(const Application());
}
