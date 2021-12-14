import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon_type.dart';
import 'package:pokeroku/model/stat_set.dart';

import '../util.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pokemon({
    required int id,
    @JsonKey(fromJson: makeOneTenth) required double height,
    @JsonKey(fromJson: makeOneTenth) required double weight,
    required int baseExperience,
    required int speciesId,
    required String identifier,
    required String speciesIdentifier,
    required String nameJp,
    required String nameEn,
    required int hp,
    required int attack,
    required int defense,
    required int specialAttack,
    required int specialDefense,
    required int speed,
    @JsonKey(fromJson: intToBool) required bool isDefault,
    String? pokespritePath,
    String? formIdentifier,
    String? formNameJp,
    String? formNameEn,
    int? pokemonMoveVersionGroupId,
    int? pokemonMoveMethodId,
    int? firstTypeId,
    int? secondTypeId,
    @JsonKey(ignore: true) PokemonType? firstType,
    @JsonKey(ignore: true) PokemonType? secondType,
    @JsonKey(fromJson: makeGenderRate) List<double>? genderRate,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  factory Pokemon.withType({
    required Map<String, dynamic> json,
    required List<PokemonType> typeList,
  }) {
    final pokemon = Pokemon.fromJson(json);
    final firstType = typeList
        .firstWhereOrNull((element) => element.id == pokemon.firstTypeId);
    final secondType = typeList
        .firstWhereOrNull((element) => element.id == pokemon.secondTypeId);
    return pokemon.copyWith(firstType: firstType, secondType: secondType);
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

  StatSet get stats {
    return StatSet(
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
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
