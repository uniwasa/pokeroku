import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

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