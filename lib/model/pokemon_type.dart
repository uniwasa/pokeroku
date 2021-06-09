import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemon_type.freezed.dart';

@freezed
class PokemonType with _$PokemonType {
  const PokemonType._();

  const factory PokemonType({
    required int id,
    required String identifier,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'damage_factors')
        required Map<int, dynamic> damageFactors,
    required Color color,
  }) = _PokemonType;
}
