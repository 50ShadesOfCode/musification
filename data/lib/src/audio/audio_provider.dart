import 'package:domain/domain.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider {
  final AudioPlayer audioPlayer;
  SongQueue? songQueue;
  Song? playingEntity;
  int? index;
  AudioProvider({
    required this.audioPlayer,
  }) {
    audioPlayer.playbackEventStream.listen((PlaybackEvent event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  Future<void> playSong(
    Song playingEntity,
    SongQueue songQueue,
    int index,
  ) async {
    this.playingEntity = playingEntity;
    this.songQueue = songQueue;
    this.index = index;
    try {
      await audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(
            'https://dl.muzking.net/files/track/2020/09/Joji_MODUS.mp3')),
      );
      audioPlayer.play();
    } catch (e) {
      print('Error loading audio source: $e');
    }
  }
}
