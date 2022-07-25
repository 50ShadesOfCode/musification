import 'package:domain/domain.dart';
import 'package:shared_dependencies/bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

export 'search_event.dart';
export 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchHistoryUseCase getSearchHistoryUseCase;
  final SetSearchHistoryUseCase setSearchHistoryUseCase;

  SearchBloc({
    required this.getSearchHistoryUseCase,
    required this.setSearchHistoryUseCase,
  }) : super(
          SearchState(searchText: '', searchHistory: <String>[]),
        ) {
    on<UpdateSearchEvent>(_onUpdateSearchEvent);
    on<InitEvent>(_onInitEvent);
    on<OnSearchPressedEvent>(_onSearchPressedEvent);
    on<RemoveHistoryElementEvent>(_onRemoveHistoryElementEvent);
  }

  Future<void> _onInitEvent(InitEvent event, Emitter<SearchState> emit) async {
    final List<String> history = getSearchHistoryUseCase.execute(NoParams());
    emit(state.copyWith(
      searchText: state.searchText,
      searchHistory: history.reversed.toList(),
    ));
  }

  Future<void> _onSearchPressedEvent(
      OnSearchPressedEvent event, Emitter<SearchState> emit) async {
    List<String> history = state.searchHistory;
    history.add(event.searchValue);
    await setSearchHistoryUseCase.execute(history);
    emit(state.copyWith(
      searchText: state.searchText,
      searchHistory: history.reversed.toList(),
    ));
  }

  Future<void> _onRemoveHistoryElementEvent(
      RemoveHistoryElementEvent event, Emitter<SearchState> emit) async {
    List<String> history = state.searchHistory.reversed.toList();
    history.removeAt(event.index);
    await setSearchHistoryUseCase.execute(history);
    emit(state.copyWith(
      searchText: state.searchText,
      searchHistory: history,
    ));
  }

  Future<void> _onUpdateSearchEvent(
      UpdateSearchEvent event, Emitter<SearchState> emit) async {
    emit(state);
  }
}
