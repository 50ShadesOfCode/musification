import 'package:flutter/material.dart';

@immutable
abstract class PreferencesEvent {}

class ChooseGenreEvent extends PreferencesEvent {
  final String title;

  ChooseGenreEvent({
    required this.title,
  });
}

class UnchooseGenreEvent extends PreferencesEvent {
  final String title;

  UnchooseGenreEvent({
    required this.title,
  });
}

class DoneChoosingEvent extends PreferencesEvent {}
