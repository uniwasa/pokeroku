import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';

final pokemonNameProvider = StateProvider((ref) => '');

final pokemonViewModelProvider =
    ChangeNotifierProvider<PokemonViewModel>((ref) {
  final name = ref.watch(pokemonNameProvider).state;
  return PokemonViewModel(ref, name);
});

class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel._(this.ref, this.name);

  factory PokemonViewModel(ProviderReference ref, String name) {
    print('gggggg');
    final pokemonViewModel = PokemonViewModel._(ref, name);
    return pokemonViewModel;
  }

  String name;

  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  ProviderReference ref;

  void setName(String s) {
    this.name = s;
    notifyListeners();
  }
}
