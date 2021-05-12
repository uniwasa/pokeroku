import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final pokeinfoViewModelProvider =
    ChangeNotifierProvider<PokeinfoViewModel>((ref) {
  return PokeinfoViewModel(
      dataSource: ref.read(pokedexDataSourceProvider),
      currentPokemon: ref.watch(currentPokemonProvider).state);
});

class PokeinfoViewModel extends ChangeNotifier {
  PokeinfoViewModel({
    required PokedexDataSource dataSource,
    required Pokemon? currentPokemon,
  })   : _dataSource = dataSource,
        _currentPokemon = currentPokemon {
    print('hello');
  }

  final PokedexDataSource _dataSource;
  final Pokemon? _currentPokemon;

// Pokemon? _pokemon;

// Pokemon? get pokemon => _currentPokemon.pokemon;
}
