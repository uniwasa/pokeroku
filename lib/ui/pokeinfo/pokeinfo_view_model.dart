import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final pokeinfoViewModelProvider =
    ChangeNotifierProvider<PokeinfoViewModel>((ref) {
  final currentPokemon = ref.watch(currentPokemonProvider);
  return PokeinfoViewModel(
      dataSource: ref.read(pokedexDataSourceProvider),
      currentPokemon: currentPokemon);
});

class PokeinfoViewModel extends ChangeNotifier {
  PokeinfoViewModel(
      {required PokedexDataSource dataSource,
      required CurrentPokemon currentPokemon})
      : _dataSource = dataSource,
        _currentPokemon = currentPokemon;

  final PokedexDataSource _dataSource;
  final CurrentPokemon _currentPokemon;

  // Pokemon? _pokemon;

  Pokemon? get pokemon => _currentPokemon.pokemon;
}
