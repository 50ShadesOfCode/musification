import 'package:domain/domain.dart';

class QueueState {
  SongQueue songQueue;
  int index;
  QueueState({
    required this.songQueue,
    required this.index,
  });

  QueueState copyWith({
    required SongQueue songQueue,
    required int index,
  }) =>
      QueueState(
        index: index,
        songQueue: songQueue,
      );
}
