// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Build _$_$_BuildFromJson(Map<String, dynamic> json) {
  return _$_Build(
    pokemonId: json['pokemonId'] as int,
    abilityId: json['abilityId'] as int?,
    natureId: json['natureId'] as int?,
    itemId: json['itemId'] as int?,
    level: json['level'] as int?,
    individualValues: json['individualValues'] == null
        ? null
        : StatSet.fromJson(json['individualValues'] as Map<String, dynamic>),
    effortValues: json['effortValues'] == null
        ? null
        : StatSet.fromJson(json['effortValues'] as Map<String, dynamic>),
    moves: _fromMoves(json['moves']),
    createdAt: const TimestampConverter().fromJson(json['createdAt']),
    updatedAt: const UpdatedTimestampConverter().fromJson(json['updatedAt']),
  );
}

Map<String, dynamic> _$_$_BuildToJson(_$_Build instance) => <String, dynamic>{
      'pokemonId': instance.pokemonId,
      'abilityId': instance.abilityId,
      'natureId': instance.natureId,
      'itemId': instance.itemId,
      'level': instance.level,
      'individualValues': instance.individualValues?.toJson(),
      'effortValues': instance.effortValues?.toJson(),
      'moves': instance.moves,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const UpdatedTimestampConverter().toJson(instance.updatedAt),
    };
