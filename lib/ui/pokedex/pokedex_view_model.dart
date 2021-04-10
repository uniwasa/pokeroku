import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/provider/database_provider.dart';

final pokedexViewModelProvider =
    ChangeNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(ref);
});

class PokedexViewModel extends ChangeNotifier {
  // PokedexViewModel(ProviderReference ref) {
  //   this.ref = ref;
  //   fetchPokemons();
  // }

  PokedexViewModel._(this.ref);

  factory PokedexViewModel(ProviderReference ref) {
    final pokedexViewModel = PokedexViewModel._(ref);
    pokedexViewModel.fetchDefaultPokemons();
    return pokedexViewModel;
  }

  List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  ProviderReference ref;

  Future<void> fetchDefaultPokemons() async {
    final db = ref.watch(databaseProvider).db;
    if (db != null) {
      String query = await rootBundle.loadString('assets/query/pokemon.sql');
      List<Map<String, dynamic>> list = await db.rawQuery(query);

      _pokemons = list.map((e) => Pokemon.fromJson(e)).toList();
      notifyListeners();
    }
  }
}
