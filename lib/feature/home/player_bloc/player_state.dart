import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/domain.dart';
import 'package:just_audio/just_audio.dart';

class AppPlayerState {
  final AudioPlayer audioPlayer;
  final CarouselController carouselController;
  final bool isPlaying;
  final Song? playingEntity;
  SongQueue songQueue;
  final int index;
  AppPlayerState({
    required this.carouselController,
    required this.audioPlayer,
    required this.isPlaying,
    required this.playingEntity,
    required this.songQueue,
    required this.index,
  });

  AppPlayerState copyWith({
    AudioPlayer? audioPlayer,
    required int index,
    required SongQueue songQueue,
    required bool isPlaying,
    Song? playingEntity,
  }) =>
      AppPlayerState(
        audioPlayer: audioPlayer ?? this.audioPlayer,
        carouselController: carouselController,
        index: index,
        songQueue: songQueue,
        isPlaying: isPlaying,
        playingEntity: playingEntity ?? this.playingEntity,
      );
}
