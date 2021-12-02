import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';

part 'pokemon_detail_state.freezed.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const PokemonDetailState._();

  const factory PokemonDetailState({
    required Pokemon pokemon,
    required AsyncValue<PokemonEx> asyncPokemonEx,
    required AsyncValue<List<Move>> asyncMoveList,
    required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
  }) = _PokemonDetailState;
}
