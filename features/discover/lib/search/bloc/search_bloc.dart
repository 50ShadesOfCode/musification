import 'package:shared_dependencies/bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

export 'search_event.dart';
export 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc()
      : super(SearchState(
          searchText: '',
        ));
}
