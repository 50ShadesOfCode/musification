import 'package:domain/domain.dart';

abstract class TrackRepository {
  const TrackRepository();

  Future<List<Song>> getTopTracks();
}
