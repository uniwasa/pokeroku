import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon_type.dart';

import '../util.dart';

part 'pokemon.freezed.dart';
// part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required int id,
    @JsonKey(fromJson: makeOneTenth) required double height,
    @JsonKey(fromJson: makeOneTenth) required double weight,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'species_id') required int speciesId,
    required String identifier,
    @JsonKey(name: 'species_identifier') required String speciesIdentifier,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'first_type') required PokemonType firstType,
    @JsonKey(name: 'second_type') required PokemonType? secondType,
    required int hp,
    required int attack,
    required int defense,
    @JsonKey(name: 'special_attack') required int specialAttack,
    @JsonKey(name: 'special_defense') required int specialDefense,
    required int speed,
    @JsonKey(name: 'is_default', fromJson: intToBool) required bool isDefault,
    @JsonKey(name: 'pokesprite_path') required String? pokespritePath,
    @JsonKey(name: 'form_identifier') required String? formIdentifier,
    @JsonKey(name: 'form_name_jp') required String? formNameJp,
    @JsonKey(name: 'form_name_en') required String? formNameEn,
    @JsonKey(name: 'pokemon_move_version_group_id')
        required int? pokemonMoveVersionGroupId,
  }) = _Pokemon;

  factory Pokemon.type(
      Map<String, dynamic> pokemon, List<PokemonType> pokemonTypes) {
    final firstType = pokemonTypes
        .firstWhere((element) => element.id == pokemon['first_type_id']);
    final secondType = pokemonTypes
        .firstWhereOrNull((element) => element.id == pokemon['second_type_id']);
    return Pokemon(
      id: pokemon['id'],
      height: makeOneTenth(pokemon['height']),
      weight: makeOneTenth(pokemon['weight']),
      baseExperience: pokemon['base_experience'],
      speciesId: pokemon['species_id'],
      identifier: pokemon['identifier'],
      speciesIdentifier: pokemon['species_identifier'],
      nameJp: pokemon['name_jp'],
      nameEn: pokemon['name_en'],
      firstType: firstType,
      secondType: secondType,
      hp: pokemon['hp'],
      attack: pokemon['attack'],
      defense: pokemon['defense'],
      specialAttack: pokemon['special_attack'],
      specialDefense: pokemon['special_defense'],
      speed: pokemon['speed'],
      isDefault: intToBool(pokemon['is_default']),
      formIdentifier: pokemon['form_identifier'],
      formNameJp: pokemon['form_name_jp'],
      formNameEn: pokemon['form_name_en'],
      pokespritePath: pokemon['pokesprite_path'],
      pokemonMoveVersionGroupId: pokemon['pokemon_move_version_group_id'],
    );
  }

  String get imageName {
    String path;
    if (isDefault) {
      path = 'regular/' + speciesIdentifier;
    } else if (formIdentifier == 'female') {
      path = 'regular_female/' + speciesIdentifier;
    } else {
      path = 'regular/' + (pokespritePath ?? identifier);
    }
    return 'assets/icons/pokemon/' + path + '.png';
  }

  String get shinyImageName {
    String path;
    if (isDefault) {
      path = 'shiny/' + speciesIdentifier;
    } else if (formIdentifier == 'female') {
      path = 'shiny_female/' + speciesIdentifier;
    } else {
      path = 'shiny/' + (pokespritePath ?? identifier);
    }
    return 'assets/icons/pokemon/' + path + '.png';
  }

  String get fullNameJp {
    if (formNameJp == null) return nameJp;
    return nameJp + ' (' + formNameJp! + ')';
  }

  String get fullNameEn {
    if (formNameEn == null) return nameEn;
    return nameEn + ' (' + formNameEn! + ')';
  }
}
