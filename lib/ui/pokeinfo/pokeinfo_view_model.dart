import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/state/current_pokemon_state.dart';

final pokeinfoViewModelProvider =
    ChangeNotifierProvider<PokeinfoViewModel>((ref) {
  return PokeinfoViewModel(
      dataSource: ref.read(pokedexDataSourceProvider),
      currentPokemonState: ref.watch(currentPokemonProvider.state));
});

class PokeinfoViewModel extends ChangeNotifier {
  PokeinfoViewModel(
      {required PokedexDataSource dataSource,
      required CurrentPokemonState currentPokemonState})
      : _dataSource = dataSource,
        _currentPokemonState = currentPokemonState {
    print('hello');
  }

  final PokedexDataSource _dataSource;
  final CurrentPokemonState _currentPokemonState;

// Pokemon? _pokemon;

// Pokemon? get pokemon => _currentPokemon.pokemon;
}
