// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      name: json['name'] as String,
      sessionKey: json['key'] as String,
      subscriber: json['subscriber'] as int,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'name': instance.name,
      'key': instance.sessionKey,
      'subscriber': instance.subscriber,
    };
