import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';

part 'pokemon_detail_state.freezed.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const PokemonDetailState._();

  const factory PokemonDetailState({
    required Pokemon pokemon,
    required AsyncValue<List<Move>> asyncMoveList,
    required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
    required AsyncValue<List<Ability>> asyncAbilityList,
    required AsyncValue<List<List<Pokemon>>> asyncEvolutionLine,
  }) = _PokemonDetailState;
}
