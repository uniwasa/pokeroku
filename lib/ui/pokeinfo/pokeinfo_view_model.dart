import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokeinfo_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/move_list_by_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/util.dart';

class PokeinfoViewModel extends StateNotifier<PokeinfoState> {
  PokeinfoViewModel({
    required Reader read,
    required AsyncValue<List<Pokemon>> allPokemons,
    required AsyncValue<List<Move>> moveList,
    required Pokemon pokemon,
  })  : _read = read,
        _allPokemons = allPokemons,
        super(PokeinfoState(
          pokemonBase: pokemon,
          asyncPokemonEx: AsyncValue.loading(),
          asyncMoves: moveList,
        )) {
    fetchExtraInfo();
  }

  final Reader _read;
  final AsyncValue<List<Pokemon>> _allPokemons;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> setPokemon(Pokemon pokemon) async {
    if (mounted) {
      state = state.copyWith(
        pokemonBase: pokemon,
        asyncPokemonEx: AsyncValue.loading(),
        asyncMoves: AsyncValue.loading(),
      );
      fetchExtraInfo();
    }
  }

  Future<void> fetchExtraInfo() async {
    if (mounted) {
      final pokemonBase = state.pokemonBase;
      //ポケモン一覧が読み込まれてるときのみ実行
      _allPokemons.whenData(
        (allPokemons) async {
          try {
            final pokemonId = pokemonBase.id;
            final extraInfo = await _read(pokedexDataSourceProvider)
                .getPokemonExtraInfo(pokemonId);
            final String flavorTextJp = extraInfo['flavor_text_jp'] as String;

            //進化取得
            final evolutions = await fetchEvolutions(allPokemons, pokemonId);
            final genderRate = makeGenderRatio(extraInfo['gender_rate']);

            final abilities = await _read(pokedexDataSourceProvider)
                .getPokemonAbilities(pokemonId);

            final pokemonEx = PokemonEx(
              base: pokemonBase,
              flavorTextJp: flavorTextJp,
              evolutions: evolutions,
              genderRatio: genderRate,
              abilities: abilities,
            );
            if (mounted)
              state =
                  state.copyWith(asyncPokemonEx: AsyncValue.data(pokemonEx));
          } on Exception catch (error) {
            if (mounted)
              state = state.copyWith(
                asyncPokemonEx: AsyncValue.error(error),
                asyncMoves: AsyncValue.error(error),
              );
          }
        },
      );
    }
  }

  Future<List<List<Pokemon>>> fetchEvolutions(
      List<Pokemon> allPokemons, int pokemonId) async {
    final evolutions =
        await _read(pokedexDataSourceProvider).getEvolutions(pokemonId);
    final firstStage = evolutions
        .where((element) => element['evolves_from_species_id'] == null)
        .toList();
    final secondStage = getNextStage(evolutions, firstStage);
    final thirdStage = getNextStage(evolutions, secondStage);
    //空でないステージのみ代入
    final stages = [firstStage, secondStage, thirdStage]
        .where((stage) => stage.isNotEmpty);

    final result = stages.map((stage) {
      return stage.map((pokemonMap) {
        return allPokemons.firstWhere((pokemon) {
          return pokemon.id == pokemonMap['id'];
        });
      }).toList();
    }).toList();
    return (result);
  }

  List<Map<String, dynamic>> getNextStage(
    List<Map<String, dynamic>> evolutions,
    List<Map<String, dynamic>> preStage,
  ) {
    return evolutions.where((element) {
      return preStage
          .map((e) => e['species_id'])
          .toList()
          .contains(element['evolves_from_species_id']);
    }).toList();
  }

  void searchForMoves(String input) {
    if (mounted) {
      final pokemon = state.pokemonBase;
      final moveList = _read(moveListByPokemonProvider(pokemon.id)).data?.value;
      if (moveList != null) {
        final filtered = moveList.where((move) {
          return hiraToKana(move.nameJp).contains(hiraToKana(input));
        }).toList();
        if (mounted)
          state = state.copyWith(asyncMoves: AsyncValue.data(filtered));
      }
    }
  }
}
