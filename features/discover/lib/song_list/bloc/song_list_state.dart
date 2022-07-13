import 'package:domain/domain.dart';

class SongListState {
  List<Song> popularSongs;
  List<Song> recommendedSongs;

  SongListState({
    required this.popularSongs,
    required this.recommendedSongs,
  });

  SongListState copyWith({
    required List<Song> popularSongs,
    required List<Song> recommendedSongs,
  }) {
    return SongListState(
      popularSongs: popularSongs,
      recommendedSongs: recommendedSongs,
    );
  }
}
