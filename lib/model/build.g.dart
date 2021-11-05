// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Build _$_$_BuildFromJson(Map<String, dynamic> json) {
  return _$_Build(
    pokemonId: json['pokemonId'] as int,
    itemId: json['itemId'] as int?,
    createdAt: const TimestampConverter().fromJson(json['createdAt']),
    updatedAt: const UpdatedTimestampConverter().fromJson(json['updatedAt']),
  );
}

Map<String, dynamic> _$_$_BuildToJson(_$_Build instance) => <String, dynamic>{
      'pokemonId': instance.pokemonId,
      'itemId': instance.itemId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const UpdatedTimestampConverter().toJson(instance.updatedAt),
    };
