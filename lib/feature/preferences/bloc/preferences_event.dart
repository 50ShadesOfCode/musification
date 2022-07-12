import 'package:flutter/material.dart';

@immutable
abstract class PreferencesEvent {}

class ChooseGenreEvent extends PreferencesEvent {
  final String title;

  ChooseGenreEvent({
    required this.title,
  });
}

class DoneChoosingEvent extends PreferencesEvent {}
