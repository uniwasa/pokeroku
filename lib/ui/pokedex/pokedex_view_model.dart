import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/providers/pokedex_data_source_provider.dart';

final pokedexViewModelProvider =
    ChangeNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(dataSource: ref.read(pokedexDataSourceProvider));
});

class PokedexViewModel extends ChangeNotifier {
  final PokedexDataSource _dataSource;

  PokedexViewModel({required PokedexDataSource dataSource})
      : _dataSource = dataSource;

  // ProviderReference ref;
  // PokedexViewModel._(this.ref);
  // factory PokedexViewModel(ProviderReference ref) {
  //   final pokedexViewModel = PokedexViewModel._(ref);
  //   pokedexViewModel.fetchDefaultPokemons();
  //   return pokedexViewModel;
  // }

  List<Pokemon>? _pokemons;

  List<Pokemon>? get pokemons => _pokemons;

  Future<void> fetchDefaultPokemons() async {
    // final db = await ref.read(pokedexDatabaseHelperProvider).database;
    // String query = await rootBundle.loadString('assets/query/pokemon.sql');
    // List<Map<String, dynamic>> list = await db.rawQuery(query);
    //
    // _pokemons = list.map((e) => Pokemon.fromJson(e)).toList();
    _pokemons = await _dataSource.getPokemons();
    notifyListeners();
  }
}
