// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Nature _$_$_NatureFromJson(Map<String, dynamic> json) {
  return _$_Nature(
    id: json['id'] as int,
    identifier: json['identifier'] as String,
    nameJp: json['name_jp'] as String,
    decreasedStatIdentifier: json['decreased_stat_identifier'] as String,
    increasedStatIdentifier: json['increased_stat_identifier'] as String,
  );
}

Map<String, dynamic> _$_$_NatureToJson(_$_Nature instance) => <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name_jp': instance.nameJp,
      'decreased_stat_identifier': instance.decreasedStatIdentifier,
      'increased_stat_identifier': instance.increasedStatIdentifier,
    };
