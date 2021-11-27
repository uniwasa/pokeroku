// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Build _$_$_BuildFromJson(Map<String, dynamic> json) {
  return _$_Build(
    pokemonId: json['pokemonId'] as int,
    abilityId: json['abilityId'] as int?,
    itemId: json['itemId'] as int?,
    individualValues: json['individualValues'] == null
        ? null
        : Stat.fromJson(json['individualValues'] as Map<String, dynamic>),
    effortValues: json['effortValues'] == null
        ? null
        : Stat.fromJson(json['effortValues'] as Map<String, dynamic>),
    createdAt: const TimestampConverter().fromJson(json['createdAt']),
    updatedAt: const UpdatedTimestampConverter().fromJson(json['updatedAt']),
  );
}

Map<String, dynamic> _$_$_BuildToJson(_$_Build instance) => <String, dynamic>{
      'pokemonId': instance.pokemonId,
      'abilityId': instance.abilityId,
      'itemId': instance.itemId,
      'individualValues': instance.individualValues?.toJson(),
      'effortValues': instance.effortValues?.toJson(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const UpdatedTimestampConverter().toJson(instance.updatedAt),
    };
