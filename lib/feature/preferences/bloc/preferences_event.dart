import 'package:flutter/material.dart';

@immutable
abstract class PreferencesEvent {}

class ChooseGenreEvent extends PreferencesEvent {
  final String title;

  ChooseGenreEvent({
    required this.title,
  });
}

<<<<<<< HEAD
class UnchooseGenreEvent extends PreferencesEvent {
  final String title;

  UnchooseGenreEvent({
    required this.title,
  });
}

=======
>>>>>>> 176816e (Add genre preferences screen.)
class DoneChoosingEvent extends PreferencesEvent {}
