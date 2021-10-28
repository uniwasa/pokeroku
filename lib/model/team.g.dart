// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$_$_TeamFromJson(Map<String, dynamic> json) {
  return _$_Team(
    name: json['name'] as String,
    createdAt: const TimestampConverter().fromJson(json['createdAt']),
  );
}

Map<String, dynamic> _$_$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'name': instance.name,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
