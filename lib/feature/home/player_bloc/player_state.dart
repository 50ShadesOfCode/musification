import 'package:domain/domain.dart';
import 'package:just_audio/just_audio.dart';

class AppPlayerState {
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final Song? playingEntity;
  AppPlayerState({
    required this.audioPlayer,
    required this.isPlaying,
    required this.playingEntity,
  });

  AppPlayerState copyWith({
    required bool isPlaying,
    Song? playingEntity,
  }) =>
      AppPlayerState(
        audioPlayer: audioPlayer,
        isPlaying: isPlaying,
        playingEntity: playingEntity,
      );
}
