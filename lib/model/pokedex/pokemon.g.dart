// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pokemon _$_$_PokemonFromJson(Map<String, dynamic> json) {
  return _$_Pokemon(
    id: json['id'] as int,
    identifier: json['identifier'] as String,
    speciesIdentifier: json['species_identifier'] as String,
    nameJp: json['name_jp'] as String,
    firstType: json['first_type'] as int,
    secondType: json['second_type'] as int?,
    firstTypeIdentifier: json['first_type_identifier'] as String,
    secondTypeIdentifier: json['second_type_identifier'] as String?,
    firstTypeName: json['first_type_name'] as String,
    secondTypeName: json['second_type_name'] as String?,
    hp: json['hp'] as int,
    attack: json['attack'] as int,
    defense: json['defense'] as int,
    specialAttack: json['special_attack'] as int,
    specialDefense: json['special_defense'] as int,
    speed: json['speed'] as int,
  );
}

Map<String, dynamic> _$_$_PokemonToJson(_$_Pokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'species_identifier': instance.speciesIdentifier,
      'name_jp': instance.nameJp,
      'first_type': instance.firstType,
      'second_type': instance.secondType,
      'first_type_identifier': instance.firstTypeIdentifier,
      'second_type_identifier': instance.secondTypeIdentifier,
      'first_type_name': instance.firstTypeName,
      'second_type_name': instance.secondTypeName,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.specialAttack,
      'special_defense': instance.specialDefense,
      'speed': instance.speed,
    };
