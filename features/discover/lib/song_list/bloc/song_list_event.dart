import 'package:flutter/material.dart';

@immutable
abstract class SongListEvent {}

class FetchPopularSongs extends SongListEvent {}

class FetchRecommendedSongs extends SongListEvent {}
