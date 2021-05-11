import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'current_pokemon_state.freezed.dart';

@freezed
class CurrentPokemonState with _$CurrentPokemonState {
  const factory CurrentPokemonState({
    Pokemon? pokemon,
  }) = _CurrentPokemonState;
}