import 'package:flutter/material.dart';

@immutable
abstract class PreferencesEvent {}

class ChooseGenreEvent extends PreferencesEvent {
  final String genre;

  ChooseGenreEvent({
    required this.genre,
  });
}

class UnchooseGenreEvent extends PreferencesEvent {
  final String genre;

  UnchooseGenreEvent({
    required this.genre,
  });
}

class DoneChoosingEvent extends PreferencesEvent {}
