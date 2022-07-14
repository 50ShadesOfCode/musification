import 'package:domain/domain.dart';

abstract class TrackRepository {
  const TrackRepository();

  Future<List<Song>> getTopTracks();

  Future<List<Song>> getRecommendedTracks(List<String> genres);
}
