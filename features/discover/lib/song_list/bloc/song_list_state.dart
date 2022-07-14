import 'package:domain/domain.dart';

class SongListState {
  List<Song> popularSongs;
  List<Song> recommendedSongs;

  bool fetchingPopularInProgressState;
  bool fetchingRecommendedInProgressState;

  SongListState({
    required this.popularSongs,
    required this.recommendedSongs,
    required this.fetchingPopularInProgressState,
    required this.fetchingRecommendedInProgressState,
  });

  SongListState copyWith({
    required List<Song> popularSongs,
    required List<Song> recommendedSongs,
    required bool fetchingPopularInProgressState,
    required bool fetchingRecommendedInProgressState,
  }) {
    return SongListState(
      fetchingPopularInProgressState: fetchingPopularInProgressState,
      fetchingRecommendedInProgressState: fetchingRecommendedInProgressState,
      popularSongs: popularSongs,
      recommendedSongs: recommendedSongs,
    );
  }
}
