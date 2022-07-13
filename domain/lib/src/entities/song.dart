import 'package:json_annotation/json_annotation.dart';

//TODO: Add serialization
class Song {
  final String title;
  final String imageUrl;
  //TODO : Add artist serialization
  final String artist;
  final String duration;
  Song({
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.duration,
  });

  Song.fromJson(Map<String, dynamic> json)
      : title = json['name'] as String,
        duration = json['duration'] as String,
        artist = json['artist']['name'] as String,
        imageUrl = (json['image'] as List<dynamic>)[0]['#text'] as String;
}
