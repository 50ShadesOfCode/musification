import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PlayerEvent {}

class InitEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}

class ResumeEvent extends PlayerEvent {}

class PlayEvent extends PlayerEvent {
  final Song song;
  PlayEvent({
    required this.song,
  });
}
