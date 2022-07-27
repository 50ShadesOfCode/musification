import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PlayerEvent {}

class OpenPlayerEvent extends PlayerEvent {}

class HidePlayerEvent extends PlayerEvent {}

class InitEvent extends PlayerEvent {}

class PauseEvent extends PlayerEvent {}

class ResumeEvent extends PlayerEvent {}

class PlayEvent extends PlayerEvent {
  SongQueue queue;
  final int index;
  final Song song;
  PlayEvent({
    required this.queue,
    required this.index,
    required this.song,
  });
}
