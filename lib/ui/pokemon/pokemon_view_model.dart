import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/provider/pokedex_data_source_provider.dart';

final pokemonViewModelProvider =
    ChangeNotifierProvider<PokemonViewModel>((ref) {
  return PokemonViewModel(dataSource: ref.read(pokedexDataSourceProvider));
});

class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel({required PokedexDataSource dataSource})
      : _dataSource = dataSource;

  final PokedexDataSource _dataSource;
  Pokemon? _pokemon;

  Pokemon? get pokemon => _pokemon;

  Future<void> fetchPokemon(int id) async {
    final pokemon = await _dataSource.getPokemon(id);
    _pokemon = pokemon;
    notifyListeners();
  }
}
