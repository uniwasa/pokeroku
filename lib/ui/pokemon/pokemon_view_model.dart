import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/provider/pokedex_data_source_provider.dart';

final currentPokemonProvider = ChangeNotifierProvider<CurrentPokemon>((ref) {
  return CurrentPokemon(dataSource: ref.read(pokedexDataSourceProvider));
});

class CurrentPokemon extends ChangeNotifier {
  CurrentPokemon({required PokedexDataSource dataSource})
      : _dataSource = dataSource;

  final PokedexDataSource _dataSource;
  Pokemon? _pokemon;

  Pokemon? get pokemon => _pokemon;

  Future<void> fetchPokemon(int id) async {
    final pokemon = await _dataSource.getPokemon(id);
    _pokemon = pokemon;
    notifyListeners();
  }

  void setPokemon(Pokemon pokemon) {
    _pokemon = pokemon;
    notifyListeners();
  }
}

final pokemonViewModelProvider =
    ChangeNotifierProvider<PokemonViewModel>((ref) {
  final currentPokemon = ref.watch(currentPokemonProvider);
  return PokemonViewModel(
      dataSource: ref.read(pokedexDataSourceProvider),
      currentPokemon: currentPokemon);
});

class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel(
      {required PokedexDataSource dataSource,
      required CurrentPokemon currentPokemon})
      : _dataSource = dataSource,
        _currentPokemon = currentPokemon;

  final PokedexDataSource _dataSource;
  final CurrentPokemon _currentPokemon;

  // Pokemon? _pokemon;

  Pokemon? get pokemon => _currentPokemon.pokemon;

// Future<void> fetchPokemon(int id) async {
//   final pokemon = await _dataSource.getPokemon(id);
//   _pokemon = pokemon;
//   notifyListeners();
// }
//
// void setPokemon(Pokemon pokemon) {
//   _pokemon = pokemon;
//   notifyListeners();
// }
}
