import 'package:discover/player/player_page.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player {
  static Page<dynamic> page(Song song, AudioPlayer player) =>
      PlayerPage(song: song, audioPlayer: player);
}
