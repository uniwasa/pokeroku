import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeroku/const/type_color.dart';

part 'pokemon.freezed.dart';

part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required int id,
    required String identifier,
    @JsonKey(name: 'species_identifier') required String speciesIdentifier,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'first_type') required int firstType,
    @JsonKey(name: 'second_type') int? secondType,
    @JsonKey(name: 'first_type_identifier') required String firstTypeIdentifier,
    @JsonKey(name: 'second_type_identifier') String? secondTypeIdentifier,
    @JsonKey(name: 'first_type_name') required String firstTypeName,
    @JsonKey(name: 'second_type_name') String? secondTypeName,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Color get color => PokemonTypeExtension.init(this.firstTypeIdentifier).color;
}
