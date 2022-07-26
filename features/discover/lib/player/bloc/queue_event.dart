import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class QueueEvent {}

class InitEvent extends QueueEvent {
  SongQueue queue;

  InitEvent({
    required this.queue,
  });
}
