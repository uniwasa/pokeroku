// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatSet _$$_StatSetFromJson(Map<String, dynamic> json) => _$_StatSet(
      hp: json['hp'] as int? ?? 0,
      attack: json['attack'] as int? ?? 0,
      defense: json['defense'] as int? ?? 0,
      specialAttack: json['specialAttack'] as int? ?? 0,
      specialDefense: json['specialDefense'] as int? ?? 0,
      speed: json['speed'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StatSetToJson(_$_StatSet instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'specialAttack': instance.specialAttack,
      'specialDefense': instance.specialDefense,
      'speed': instance.speed,
    };
