import 'package:json_annotation/json_annotation.dart';
import 'package:shared_dependencies/xml.dart';

part 'session.g.dart';

@JsonSerializable(includeIfNull: false)
class Session {
  /// Name of the session. It contains the user name most of the time.
  @JsonKey(name: 'name')
  String name;

  /// This is the key of a LastFM session.
  @JsonKey(name: 'key')
  String sessionKey;

  /// This gives the subscriber number.
  @JsonKey(name: 'subscriber')
  int subscriber;

  Session({
    required this.name,
    required this.sessionKey,
    required this.subscriber,
  });

  factory Session.fromXml(String xml) {
    final XmlNode data = XmlDocument.parse(xml)
        .findElements('lfm')
        .first
        .findElements('session')
        .first;
    return Session(
      name: data.findElements('name').first.text,
      sessionKey: data.findElements('key').first.text,
      subscriber: int.parse(data.findElements('subscriber').first.text),
    );
  }

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
