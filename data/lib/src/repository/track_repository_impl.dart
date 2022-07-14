import 'package:data/src/lastfm/lastfm_api_provider.dart';
import 'package:domain/domain.dart';

class TrackRepositoryImpl extends TrackRepository {
  final LastFMProvider apiProvider;

  TrackRepositoryImpl({
    required this.apiProvider,
  });

  @override
  Future<List<Song>> getTopTracks() async {
    return await apiProvider.getTopTracks();
  }

  @override
  Future<List<Song>> getRecommendedTracks(List<String> genres) async {
    return apiProvider.getRecommendedTracks(genres);
  }
}
