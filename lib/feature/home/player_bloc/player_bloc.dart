import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_dependencies/bloc.dart';

import 'player_event.dart';
import 'player_state.dart';

export 'player_event.dart';
export 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, AppPlayerState> {
  PlayerBloc() : super(AppPlayerState(audioPlayer: AudioPlayer())) {
    on<InitEvent>(_onInitEvent);
    on<PlayEvent>(_onPlayEvent);
    on<PauseEvent>(_onPauseEvent);
    on<ResumeEvent>(_onResumeEvent);
  }

  Future<void> _onInitEvent(
      InitEvent event, Emitter<AppPlayerState> emit) async {
    final AudioSession session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    state.audioPlayer.playbackEventStream.listen((PlaybackEvent event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  Future<void> _onPlayEvent(
      PlayEvent event, Emitter<AppPlayerState> emit) async {
    try {
      await state.audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(
          'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3')));
    } catch (e) {
      print('Error loading audio source: $e');
    }
  }

  Future<void> _onPauseEvent(
      PauseEvent event, Emitter<AppPlayerState> emit) async {
    state.audioPlayer.pause();
    emit(state);
  }

  Future<void> _onResumeEvent(
      ResumeEvent event, Emitter<AppPlayerState> emit) async {
    state.audioPlayer.play();
    emit(state);
  }

  @override
  Future<void> close() async {
    state.audioPlayer.dispose();
    super.close();
  }
}
