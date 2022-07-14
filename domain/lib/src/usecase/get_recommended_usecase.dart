import 'package:domain/domain.dart';

class GetRecommendedTracksUseCase
    extends FutureUseCase<List<Song>, List<String>> {
  final TrackRepository _trackRepository;

  GetRecommendedTracksUseCase({
    required TrackRepository trackRepository,
  }) : _trackRepository = trackRepository;

  @override
  Future<List<Song>> execute(List<String> params) async {
    return _trackRepository.getRecommendedTracks(params);
  }
}
