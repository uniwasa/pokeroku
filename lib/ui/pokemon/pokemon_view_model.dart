import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/provider/pokedex_data_source_provider.dart';

final pokemonIdProvider = StateProvider((ref) => 0);

final pokemonViewModelProvider =
    ChangeNotifierProvider<PokemonViewModel>((ref) {
  final pokemonId = ref.watch(pokemonIdProvider).state;
  return PokemonViewModel(
      dataSource: ref.read(pokedexDataSourceProvider), id: pokemonId);
});

class PokemonViewModel extends ChangeNotifier {
  PokemonViewModel({required PokedexDataSource dataSource, required int id})
      : _dataSource = dataSource,
        _id = id {
    fetchPokemon(); //todo:ここの初期処理の方法考えろ
  }

  final PokedexDataSource _dataSource;
  int _id;
  Pokemon? pokemon;

  Future<void> fetchPokemon() async {
    final pokemon = await _dataSource.getPokemon(_id);
    this.pokemon = pokemon;
    notifyListeners();
  }
}
