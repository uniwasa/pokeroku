import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeroku/const/type_color.dart';

import '../util.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required int id,
    @JsonKey(name: 'species_id') required int speciesId,
    required String identifier,
    @JsonKey(name: 'species_identifier') required String speciesIdentifier,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'first_type') required int firstType,
    @JsonKey(name: 'second_type') int? secondType,
    @JsonKey(name: 'first_type_identifier') required String firstTypeIdentifier,
    @JsonKey(name: 'second_type_identifier') String? secondTypeIdentifier,
    @JsonKey(name: 'first_type_name') required String firstTypeName,
    @JsonKey(name: 'second_type_name') String? secondTypeName,
    required int hp,
    required int attack,
    required int defense,
    @JsonKey(name: 'special_attack') required int specialAttack,
    @JsonKey(name: 'special_defense') required int specialDefense,
    required int speed,
    @JsonKey(name: 'is_default', fromJson: intToBool) required bool isDefault,
    @JsonKey(name: 'pokesprite_path') String? pokespritePath,
    @JsonKey(name: 'form_name_jp') String? formNameJp,
    @JsonKey(name: 'form_name_en') String? formNameEn,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Color get color => PokemonTypeExtension.init(this.firstTypeIdentifier).color;

  String get imageName {
    String path;
    if (isDefault) {
      path = speciesIdentifier;
    } else {
      path = pokespritePath ?? identifier;
    }
    return 'assets/icons/pokemon/regular/' + path + '.png';
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
