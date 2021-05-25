import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'pokemon_ex.freezed.dart';

@freezed
class PokemonEx with _$PokemonEx {
  const PokemonEx._();

  const factory PokemonEx({
    required String flavorTextJp,
    required List<List<Pokemon>> evolutions,
  }) = _PokemonEx;
}
