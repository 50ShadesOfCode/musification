import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_dependencies/bloc.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;
  final AudioPlayer audioPlayer;

  PlayerScreen({
    required this.song,
    required this.audioPlayer,
  });

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late Song song;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    song = widget.song;
    audioPlayer = widget.audioPlayer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<PlayerBloc>(context).add(HidePlayerEvent());
          },
          icon: const Icon(
            CupertinoIcons.chevron_down,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Text(
              'Now playing',
              style: AppFonts.sfUi14Regular.copyWith(
                color: AppTheme.secondaryColor,
              ),
            ),
            Text(
              'TODO',
              style: AppFonts.sfUi18Bold.copyWith(
                color: AppTheme.activeColor,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
