// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pokemon _$_$_PokemonFromJson(Map<String, dynamic> json) {
  return _$_Pokemon(
    id: json['id'] as int,
    height: makeOneTenth(json['height'] as int),
    weight: makeOneTenth(json['weight'] as int),
    baseExperience: json['base_experience'] as int,
    speciesId: json['species_id'] as int,
    identifier: json['identifier'] as String,
    speciesIdentifier: json['species_identifier'] as String,
    nameJp: json['name_jp'] as String,
    nameEn: json['name_en'] as String,
    hp: json['hp'] as int,
    attack: json['attack'] as int,
    defense: json['defense'] as int,
    specialAttack: json['special_attack'] as int,
    specialDefense: json['special_defense'] as int,
    speed: json['speed'] as int,
    isDefault: intToBool(json['is_default'] as int),
    pokespritePath: json['pokesprite_path'] as String?,
    formIdentifier: json['form_identifier'] as String?,
    formNameJp: json['form_name_jp'] as String?,
    formNameEn: json['form_name_en'] as String?,
    pokemonMoveVersionGroupId: json['pokemon_move_version_group_id'] as int?,
    pokemonMoveMethodId: json['pokemon_move_method_id'] as int?,
    firstTypeId: json['first_type_id'] as int?,
    secondTypeId: json['second_type_id'] as int?,
    genderRate: makeGenderRate(json['gender_rate'] as int),
  );
}

Map<String, dynamic> _$_$_PokemonToJson(_$_Pokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'base_experience': instance.baseExperience,
      'species_id': instance.speciesId,
      'identifier': instance.identifier,
      'species_identifier': instance.speciesIdentifier,
      'name_jp': instance.nameJp,
      'name_en': instance.nameEn,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.specialAttack,
      'special_defense': instance.specialDefense,
      'speed': instance.speed,
      'is_default': instance.isDefault,
      'pokesprite_path': instance.pokespritePath,
      'form_identifier': instance.formIdentifier,
      'form_name_jp': instance.formNameJp,
      'form_name_en': instance.formNameEn,
      'pokemon_move_version_group_id': instance.pokemonMoveVersionGroupId,
      'pokemon_move_method_id': instance.pokemonMoveMethodId,
      'first_type_id': instance.firstTypeId,
      'second_type_id': instance.secondTypeId,
      'gender_rate': instance.genderRate,
    };
