import 'package:domain/domain.dart';
import 'package:shared_dependencies/bloc.dart';

import 'queue_event.dart';
import 'queue_state.dart';

export 'queue_event.dart';
export 'queue_state.dart';

class QueueBloc extends Bloc<QueueEvent, QueueState> {
  QueueBloc() : super(QueueState(queue: <Song>[]));
}
