import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon.dart';

import 'ability.dart';

part 'pokemon_ex.freezed.dart';

@freezed
class PokemonEx with _$PokemonEx {
  const PokemonEx._();

  const factory PokemonEx({
    required Pokemon base,
    required String flavorTextJp,
    required List<List<Pokemon>> evolutions,
    required List<double>? genderRatio,
    required List<Ability> normalAbilities,
    required Ability? hiddenAbility,
  }) = _PokemonEx;
}
