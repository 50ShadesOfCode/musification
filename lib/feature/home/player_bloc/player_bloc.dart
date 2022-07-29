import 'package:audio_session/audio_session.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data/data.dart';
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
  final AudioProvider _audioProvider;

  PlayerBloc({
    required AudioProvider audioProvider,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        _audioProvider = audioProvider,
        super(
          AppPlayerState(
            audioPlayer: AudioPlayer(),
            carouselController: CarouselController(),
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
    emit(
      state.copyWith(
        audioPlayer: _audioProvider.audioPlayer,
        index: _audioProvider.index ?? 0,
        songQueue: _audioProvider.songQueue ?? state.songQueue,
        isPlaying: _audioProvider.audioPlayer.playing,
        playingEntity: _audioProvider.playingEntity,
      ),
    );
    print(state.playingEntity);
  }

  Future<void> _onHidePlayerEvent(
      HidePlayerEvent event, Emitter<AppPlayerState> emit) async {
    _appRouter.pop();
    _audioProvider.audioPlayer.play();
    emit(state);
  }

  Future<void> _onPlayEvent(
      PlayEvent event, Emitter<AppPlayerState> emit) async {
    print('play event');
    //TODO: Find better api:)
    _audioProvider.playSong(event.song, event.queue, event.index);
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
    emit(state.copyWith(
      index: state.index,
      songQueue: state.songQueue,
      isPlaying: false,
    ));
  }

  Future<void> _onResumeEvent(
      ResumeEvent event, Emitter<AppPlayerState> emit) async {
    state.audioPlayer.play();
    emit(state.copyWith(
      index: state.index,
      songQueue: state.songQueue,
      isPlaying: true,
    ));
  }

  Future<void> _onOpenPlayerEvent(
      OpenPlayerEvent event, Emitter<AppPlayerState> emit) async {
    print(_audioProvider.playingEntity!.title);
    _appRouter.push(Player.page());
    emit(state);
  }
}
