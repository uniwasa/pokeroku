import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/const/type_color.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_type.dart';
import 'package:pokeroku/provider/pokedex_database_provider.dart';

final pokedexDataSourceProvider = Provider<PokedexDataSource>((ref) {
  return PokedexDataSource(
      databaseHelper: ref.read(pokedexDatabaseHelperProvider));
});

class PokedexDataSource {
  PokedexDataSource({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;
  DatabaseHelper _databaseHelper;

  Future<List<PokemonType>> getPokemonTypes() async {
    final db = await _databaseHelper.database;
    String typeQuery = await rootBundle.loadString('assets/query/types.sql');
    List<Map<String, dynamic>> rawTypes = await db.rawQuery(typeQuery);
    String typeEfficacyQuery =
        await rootBundle.loadString('assets/query/type_efficacy.sql');
    List<Map<String, dynamic>> rawTypeEfficacy =
        await db.rawQuery(typeEfficacyQuery);

    final List<PokemonType> pokemonTypes = rawTypes.map((e) {
      final efficacy = rawTypeEfficacy
          .where((element) => e['id'] == element['target_type_id']);
      Map<int, dynamic> damageFactors = Map();
      efficacy.forEach((element) {
        final int id = element['damage_type_id'];
        damageFactors[id] = element['damage_factor'];
      });
      return PokemonType(
          id: e['id'],
          identifier: e['identifier'],
          nameJp: e['name_jp'],
          damageFactors: damageFactors,
          color: PokemonTypeExtension.init(e['identifier']).color);
    }).toList();

    return pokemonTypes;
  }

  Future<List<Pokemon>> getPokemons() async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/all_pokemons.sql');
    List<Map<String, dynamic>> rawPokemons = await db.rawQuery(query);
    final pokemonTypes = await getPokemonTypes();

    return rawPokemons.map((rawPokemon) {
      return Pokemon.type(rawPokemon, pokemonTypes);
    }).toList();
  }

  Future<Pokemon> getPokemon(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/pokemon.sql');
    final rawPokemon = (await db.rawQuery(query, [pokemonId])).first;
    final pokemonTypes = await getPokemonTypes();
    final pokemon = Pokemon.type(rawPokemon, pokemonTypes);

    return pokemon;
  }

  Future<Map<String, dynamic>> getPokemonExtraInfo(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/pokemon_ex.sql');
    final result = (await db.rawQuery(query, [pokemonId])).first;

    return result;
  }

  Future<List<Map<String, dynamic>>> getEvolutions(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/evolutions.sql');
    final evolutions = await db.rawQuery(query, [pokemonId]);
    return evolutions;
  }

  Future<List<Map<String, dynamic>>> getPokemonAbilities(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query =
        await rootBundle.loadString('assets/query/pokemon_abilities.sql');
    final abilities = await db.rawQuery(query, [pokemonId]);
    return abilities;
  }

  Future<List<Pokemon>> getAbilityPokemons(int abilityId) async {
    final db = await _databaseHelper.database;
    String query =
        await rootBundle.loadString('assets/query/ability_pokemons.sql');
    final rawPokemons = await db.rawQuery(query, [abilityId]);
    final pokemonTypes = await getPokemonTypes();

    return rawPokemons.map((rawPokemon) {
      return Pokemon.type(rawPokemon, pokemonTypes);
    }).toList();
  }
}
