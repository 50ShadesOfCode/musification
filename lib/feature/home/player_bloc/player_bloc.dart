import 'package:audio_session/audio_session.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:discover/player/player.dart';
import 'package:domain/domain.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_dependencies/bloc.dart';

import 'player_event.dart';
import 'player_state.dart';

export 'player_event.dart';
export 'player_state.dart';

//TODO: Add carouselcontroller to state
class PlayerBloc extends Bloc<PlayerEvent, AppPlayerState> {
  final AppRouter _appRouter;

  PlayerBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(
          AppPlayerState(
            carouselController: CarouselController(),
            audioPlayer: AudioPlayer(),
            isPlaying: false,
            playingEntity: null,
            index: 0,
            songQueue: SongQueue(
              queue: <Song>[],
              title: '',
            ),
          ),
        ) {
    on<InitEvent>(_onInitEvent);
    on<PlayEvent>(_onPlayEvent);
    on<PauseEvent>(_onPauseEvent);
    on<ResumeEvent>(_onResumeEvent);
    on<OpenPlayerEvent>(_onOpenPlayerEvent);
    on<HidePlayerEvent>(_onHidePlayerEvent);
  }

  Future<void> _onInitEvent(
      InitEvent event, Emitter<AppPlayerState> emit) async {
    /*final AudioSession session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    */
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
    print('play event');
    //TODO: Find better api:)
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    try {
      await state.audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(
            'https://dl.muzking.net/files/track/2020/09/Joji_MODUS.mp3')),
      );
      state.audioPlayer.play();
    } catch (e) {
      print('Error loading audio source: $e');
      emit(state.copyWith(
        isPlaying: false,
        songQueue: state.songQueue,
        index: state.index,
      ));
      return;
    }
    emit(state.copyWith(
      isPlaying: true,
      songQueue: event.queue,
      index: state.index,
      playingEntity: event.song,
    ));
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
    _appRouter.push(Player.page());
    emit(state);
  }

  @override
  Future<void> close() async {
    state.audioPlayer.dispose();
    super.close();
  }
}
