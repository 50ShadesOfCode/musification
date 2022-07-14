import 'package:domain/domain.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'song_list_event.dart';
import 'song_list_state.dart';

export 'song_list_event.dart';
export 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  final AppRouter _appRouter;
  final GetTopTracksUseCase _getTopTracksUseCase;
  final GetPreferredGenresUseCase _getPreferredGenresUseCase;
  final GetRecommendedTracksUseCase _getRecommendedTracksUseCase;
  SongListBloc({
    required GetPreferredGenresUseCase getPreferredGenresUseCase,
    required GetRecommendedTracksUseCase getRecommendedTracksUseCase,
    required AppRouter appRouter,
    required GetTopTracksUseCase getTopTracksUseCase,
  })  : _appRouter = appRouter,
        _getRecommendedTracksUseCase = getRecommendedTracksUseCase,
        _getPreferredGenresUseCase = getPreferredGenresUseCase,
        _getTopTracksUseCase = getTopTracksUseCase,
        super(
          SongListState(
            popularSongs: <Song>[],
            recommendedSongs: <Song>[],
            fetchingPopularInProgressState: false,
            fetchingRecommendedInProgressState: false,
          ),
        ) {
    on<FetchRecommendedSongs>(_onFetchRecommendedSongs);
    on<FetchPopularSongs>(_onFetchPopularSongs);
  }
  //TODO : Add fetching from API
  Future<void> _onFetchRecommendedSongs(
      FetchRecommendedSongs event, Emitter<SongListState> emit) async {
    emit(
      state.copyWith(
        popularSongs: state.popularSongs,
        recommendedSongs: state.recommendedSongs,
        fetchingPopularInProgressState: state.fetchingPopularInProgressState,
        fetchingRecommendedInProgressState: true,
      ),
    );
    final List<String> preferredGenres =
        _getPreferredGenresUseCase.execute(NoParams());
    final List<Song> recommendedSongs =
        await _getRecommendedTracksUseCase.execute(preferredGenres);
    emit(state.copyWith(
      popularSongs: state.popularSongs,
      recommendedSongs: recommendedSongs,
      fetchingPopularInProgressState: false,
      fetchingRecommendedInProgressState:
          state.fetchingRecommendedInProgressState,
    ));
  }

  Future<void> _onFetchPopularSongs(
      FetchPopularSongs event, Emitter<SongListState> emit) async {
    emit(
      state.copyWith(
        popularSongs: state.popularSongs,
        recommendedSongs: state.recommendedSongs,
        fetchingPopularInProgressState: true,
        fetchingRecommendedInProgressState:
            state.fetchingRecommendedInProgressState,
      ),
    );
    final List<Song> popularSongs =
        await _getTopTracksUseCase.execute(NoParams());
    emit(
      state.copyWith(
        popularSongs: popularSongs,
        recommendedSongs: state.recommendedSongs,
        fetchingPopularInProgressState: false,
        fetchingRecommendedInProgressState:
            state.fetchingRecommendedInProgressState,
      ),
    );
  }
}
