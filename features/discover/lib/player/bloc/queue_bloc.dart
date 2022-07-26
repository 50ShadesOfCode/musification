import 'package:domain/domain.dart';
import 'package:shared_dependencies/bloc.dart';

import 'queue_event.dart';
import 'queue_state.dart';

export 'queue_event.dart';
export 'queue_state.dart';

//TODO: Move queue logic to player bloc

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  QueueBloc()
      : super(
          QueueState(
            index: 0,
            songQueue: SongQueue(
              title: '',
              queue: <Song>[],
            ),
          ),
        ) {
    on<InitEvent>(_onInitEvent);
  }
  Future<void> _onInitEvent(InitEvent event, Emitter<QueueState> emit) async {
    emit(state.copyWith(songQueue: event.queue, index: state.index));
  }
}
