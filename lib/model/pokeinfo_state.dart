import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';

part 'pokeinfo_state.freezed.dart';

@freezed
class PokeinfoState with _$PokeinfoState {
  const PokeinfoState._();

  const factory PokeinfoState({
    required Pokemon pokemonBase,
    required AsyncValue<PokemonEx> asyncPokemonEx,
    required AsyncValue<List<Move>> asyncMoves,
  }) = _PokeinfoState;
}
