import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/providers/pokedex_database_provider.dart';

final pokedexDataSourceProvider = Provider<PokedexDataSource>((ref) {
  return PokedexDataSource(
      databaseHelper: ref.read(pokedexDatabaseHelperProvider));
});

class PokedexDataSource {
  PokedexDataSource({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;
  DatabaseHelper _databaseHelper;

  Future<List<Pokemon>> getPokemons() async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/pokemon.sql');
    List<Map<String, dynamic>> list = await db.rawQuery(query);

    return list.map((e) => Pokemon.fromJson(e)).toList();
  }
}
