import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/error_view/error_page.dart';

class ErrorRoute {
  static Page<dynamic> page(String title) => ErrorPage(message: title);
}
