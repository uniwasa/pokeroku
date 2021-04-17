import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';

part 'pokedex_state.freezed.dart';

@freezed
class PokedexState with _$PokedexState {
  const factory PokedexState({
    List<Pokemon>? pokemons,
  }) = _PokedexState;
}