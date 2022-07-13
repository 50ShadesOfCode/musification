import 'package:domain/domain.dart';

class GetTopTracksUseCase extends FutureUseCase<List<Song>, NoParams> {
  final TrackRepository _trackRepository;

  GetTopTracksUseCase({
    required TrackRepository trackRepository,
  }) : _trackRepository = trackRepository;

  @override
  Future<List<Song>> execute(NoParams params) async {
    return _trackRepository.getTopTracks();
  }
}
