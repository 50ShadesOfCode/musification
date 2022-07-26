import 'package:audio_session/audio_session.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:discover/player/player.dart';

import 'player_event.dart';
import 'player_state.dart';

export 'player_event.dart';
export 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, AppPlayerState> {
  final AppRouter _appRouter;

  PlayerBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(AppPlayerState(
          audioPlayer: AudioPlayer(),
          isPlaying: false,
          playingEntity: null,
        )) {
    on<InitEvent>(_onInitEvent);
    on<PlayEvent>(_onPlayEvent);
    on<PauseEvent>(_onPauseEvent);
    on<ResumeEvent>(_onResumeEvent);
    on<OpenPlayerEvent>(_onOpenPlayerEvent);
    on<HidePlayerEvent>(_onHidePlayerEvent);
  }

  Future<void> _onInitEvent(
      InitEvent event, Emitter<AppPlayerState> emit) async {
    final AudioSession session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    state.audioPlayer.playbackEventStream.listen((PlaybackEvent event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    emit(state);
  }

  Future<void> _onHidePlayerEvent(
      HidePlayerEvent event, Emitter<AppPlayerState> emit) async {
    _appRouter.pop();
    emit(state);
  }

  Future<void> _onPlayEvent(
      PlayEvent event, Emitter<AppPlayerState> emit) async {
    try {
      await state.audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(
          'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3')));
    } catch (e) {
      print('Error loading audio source: $e');
      emit(state.copyWith(isPlaying: false));
      return;
    }
    emit(state.copyWith(isPlaying: true));
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

  Future<void> _onOpenPlayerEvent(
      OpenPlayerEvent event, Emitter<AppPlayerState> emit) async {
    _appRouter.push(Player.page(state.playingEntity!, state.audioPlayer));
    emit(state);
  }

  @override
  Future<void> close() async {
    state.audioPlayer.dispose();
    super.close();
  }
}
