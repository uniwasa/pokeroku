import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/const/type_color.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/item.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/nature.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';
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

  Future<List<Pokemon>> getPokemonList(
      {required List<PokemonType> typeList}) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/all_pokemons.sql');
    List<Map<String, dynamic>> rawPokemons = await db.rawQuery(query);

    return rawPokemons.map((json) {
      return Pokemon.withType(json: json, typeList: typeList);
    }).toList();
  }

  Future<List<PokemonFlavorText>> getPokemonFlavorTextList(
      int pokemonId) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle
        .loadString('assets/query/pokemon_flavor_text_list.sql');
    final result = await db.rawQuery(query, [pokemonId]);

    return result.map((json) => PokemonFlavorText.fromJson(json)).toList();
  }

  Future<List<Map<String, dynamic>>> getEvolutions(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/evolutions.sql');
    final evolutions = await db.rawQuery(query, [pokemonId]);
    return evolutions;
  }

  Future<List<Ability>> getPokemonAbilities(int pokemonId) async {
    final db = await _databaseHelper.database;
    String query =
        await rootBundle.loadString('assets/query/pokemon_abilities.sql');
    final rawAbilities = await db.rawQuery(query, [pokemonId]);
    final abilities = rawAbilities.map((e) => Ability.fromJson(e)).toList();
    return abilities;
  }

  Future<List<Pokemon>> getPokemonListByAbility(
      {required int abilityId, required List<PokemonType> typeList}) async {
    final db = await _databaseHelper.database;
    String query =
        await rootBundle.loadString('assets/query/ability_pokemons.sql');
    final rawPokemons = await db.rawQuery(query, [abilityId]);

    return rawPokemons.map((json) {
      return Pokemon.withType(json: json, typeList: typeList);
    }).toList();
  }

  Future<List<Pokemon>> getPokemonListByMove(
      {required int moveId, required List<PokemonType> typeList}) async {
    final db = await _databaseHelper.database;
    String pokemonsNoEggQuery =
        await rootBundle.loadString('assets/query/move_pokemons_no_egg.sql');
    final rawPokemonsNoEgg = await db.rawQuery(pokemonsNoEggQuery, [moveId]);
    String pokemonsEggQuery =
        await rootBundle.loadString('assets/query/move_pokemons_egg.sql');
    final rawPokemonsEgg = await db.rawQuery(pokemonsEggQuery, [moveId]);
    final rawPokemons = rawPokemonsNoEgg + rawPokemonsEgg;

    return rawPokemons.map((json) {
      return Pokemon.withType(json: json, typeList: typeList);
    }).toList();
  }

  Future<List<Item>> getItemList() async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/item_list.sql');
    List<Map<String, dynamic>> queryResult = await db.rawQuery(query);
    return queryResult.map((json) => Item.fromJson(json)).toList();
  }

  Future<List<Nature>> getNatureList() async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/nature_list.sql');
    List<Map<String, dynamic>> queryResult = await db.rawQuery(query);
    return queryResult.map((json) => Nature.fromJson(json)).toList();
  }

  Future<List<Move>> getMoveList({required List<PokemonType> typeList}) async {
    final db = await _databaseHelper.database;
    String query = await rootBundle.loadString('assets/query/move_list.sql');
    List<Map<String, dynamic>> queryResult = await db.rawQuery(query);
    return queryResult
        .map((json) => Move.withType(json: json, typeList: typeList))
        .toList();
  }

  Future<List<Move>> getMoveListByPokemon(
      {required int pokemonId, required List<PokemonType> typeList}) async {
    final db = await _databaseHelper.database;
    final String movesNoEggQuery =
        await rootBundle.loadString('assets/query/pokemon_moves_no_egg.sql');
    final rawMovesNoEgg = await db.rawQuery(movesNoEggQuery, [pokemonId]);
    final String movesEggQuery =
        await rootBundle.loadString('assets/query/pokemon_moves_egg.sql');
    final rawMovesEgg = await db.rawQuery(movesEggQuery, [pokemonId]);
    final rawMoves = rawMovesNoEgg + rawMovesEgg;

    return rawMoves
        .map((json) => Move.withType(json: json, typeList: typeList))
        .toList();
  }
}
