import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/preferences/bloc/preferences_event.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'preferences_event.dart';
import 'preferences_state.dart';

export 'preferences_event.dart';
export 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final AppRouter _appRouter;
  final SetPreferredUseCase _setPreferredUseCase;
  PreferencesBloc({
    required AppRouter appRouter,
    required SetPreferredUseCase setPreferredUseCase,
  })  : _appRouter = appRouter,
        _setPreferredUseCase = setPreferredUseCase,
<<<<<<< HEAD
        super(PreferencesState(
=======
        super(const PreferencesState(
>>>>>>> 176816e (Add genre preferences screen.)
          chosenGenres: <String>[],
          chosenGenresAmount: 0,
          isDoneButtonVisible: false,
        )) {
    on<ChooseGenreEvent>(_onChooseGenreEvent);
    on<DoneChoosingEvent>(_onDoneChoosingEvent);
<<<<<<< HEAD
    on<UnchooseGenreEvent>(_onUnchooseGenreEvent);
=======
>>>>>>> 176816e (Add genre preferences screen.)
  }

  Future<void> _onChooseGenreEvent(
      ChooseGenreEvent event, Emitter<PreferencesState> emit) async {
<<<<<<< HEAD
    List<String> chosenGenres = state.chosenGenres;
=======
    final List<String> chosenGenres = state.chosenGenres;
>>>>>>> 176816e (Add genre preferences screen.)
    chosenGenres.add(event.title);
    if (state.chosenGenresAmount + 1 < 3) {
      emit(state.copyWith(
        chosenGenresAmount: state.chosenGenresAmount + 1,
        chosenGenres: chosenGenres,
        isDoneButtonVisible: state.isDoneButtonVisible,
      ));
    } else {
      emit(state.copyWith(
        chosenGenresAmount: state.chosenGenresAmount + 1,
        chosenGenres: chosenGenres,
        isDoneButtonVisible: true,
      ));
    }
  }

<<<<<<< HEAD
  Future<void> _onUnchooseGenreEvent(
      UnchooseGenreEvent event, Emitter<PreferencesState> emit) async {
    List<String> chosenGenres = state.chosenGenres;
    chosenGenres.remove(event.title);
    if (state.chosenGenresAmount - 1 < 3) {
      emit(state.copyWith(
        chosenGenresAmount: state.chosenGenresAmount - 1,
        chosenGenres: chosenGenres,
        isDoneButtonVisible: false,
      ));
    } else {
      emit(state.copyWith(
        chosenGenresAmount: state.chosenGenresAmount - 1,
        chosenGenres: chosenGenres,
        isDoneButtonVisible: state.isDoneButtonVisible,
      ));
    }
  }

=======
>>>>>>> 176816e (Add genre preferences screen.)
  Future<void> _onDoneChoosingEvent(
      DoneChoosingEvent event, Emitter<PreferencesState> emit) async {
    _setPreferredUseCase.execute(state.chosenGenres);
    _appRouter.push(Home.page);
    emit(state);
  }
}
