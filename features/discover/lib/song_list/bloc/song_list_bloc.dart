import 'package:domain/domain.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'song_list_event.dart';
import 'song_list_state.dart';

export 'song_list_event.dart';
export 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  final AppRouter _appRouter;
  SongListBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
          SongListState(
            popularSongs: <Song>[],
            recommendedSongs: <Song>[],
          ),
        ) {
    on<FetchRecommendedSongs>(_onFetchRecommendedSongs);
    on<FetchPopularSongs>(_onFetchPopularSongs);
  }
  //TODO : Add fetching from API
  Future<void> _onFetchRecommendedSongs(
      FetchRecommendedSongs event, Emitter<SongListState> emit) async {}
  Future<void> _onFetchPopularSongs(
      FetchPopularSongs event, Emitter<SongListState> emit) async {}
}
