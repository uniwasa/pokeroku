import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemon_flavor_text.freezed.dart';
part 'pokemon_flavor_text.g.dart';

@freezed
class PokemonFlavorText with _$PokemonFlavorText {
  const PokemonFlavorText._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PokemonFlavorText({
    required int versionId,
    required String flavorTextJp,
    required String flavorTextEn,
  }) = _PokemonFlavorText;

  factory PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavorTextFromJson(json);
}
