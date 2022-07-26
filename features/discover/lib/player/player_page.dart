import 'package:discover/player/bloc/queue_bloc.dart';
import 'package:discover/player/player_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_dependencies/bloc.dart';

class PlayerPage extends Page<dynamic> {
  final Song song;
  final AudioPlayer audioPlayer;
  const PlayerPage({
    required this.song,
    required this.audioPlayer,
  });

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
      settings: this,
      builder: (BuildContext context) => BlocProvider<QueueBloc>(
        create: (BuildContext context) => QueueBloc(),
        child: PlayerScreen(
          song: song,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}
