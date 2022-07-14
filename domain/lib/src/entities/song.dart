import 'package:json_annotation/json_annotation.dart';

//TODO: Add serialization
class Song {
  final String title;
  final String imageUrl;
  //TODO : Add artist serialization
  final String artist;
  late String duration;
  Song({
    required this.title,
    required this.imageUrl,
    required this.artist,
    required this.duration,
  });

  Song.fromJson(Map<String, dynamic> json)
      : title = json['name'] as String,
        artist = json['artist']['name'] as String,
        imageUrl = (json['image'] as List<dynamic>)[0]['#text'] as String {
    duration = parseDuration(json['duration'] as String);
  }

  String parseDuration(String durations) {
    final int dur = int.parse(durations);
    final int min = dur ~/ 60;
    final int sec = dur % 60;
    return min.toString() +
        ':' +
        (sec > 10 ? sec.toString() : '0' + sec.toString());
  }
}
