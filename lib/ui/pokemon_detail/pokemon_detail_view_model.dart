import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';
import 'package:pokeroku/provider/move_list_by_pokemon_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/util.dart';

class PokemonDetailViewModel extends StateNotifier<PokemonDetailState> {
  PokemonDetailViewModel({
    required Reader read,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
    required AsyncValue<List<Move>> asyncMoveList,
    required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
    required Pokemon pokemon,
  })  : _read = read,
        _pokemonList = asyncPokemonList,
        super(PokemonDetailState(
          pokemon: pokemon,
          asyncPokemonEx: AsyncValue.loading(),
          asyncMoveList: asyncMoveList,
          asyncPokemonFlavorTextList: asyncPokemonFlavorTextList,
        )) {
    init();
  }

  final Reader _read;
  final AsyncValue<List<Pokemon>> _pokemonList;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    if (mounted) {
      final pokemon = state.pokemon;
      //ポケモン一覧が読み込まれてるときのみ実行
      _pokemonList.whenData(
        (pokemonList) async {
          try {
            final pokemonId = pokemon.id;

            //進化取得
            final evolutions = await fetchEvolutions(pokemonList, pokemonId);

            final abilities = await _read(pokedexDataSourceProvider)
                .getPokemonAbilities(pokemonId);

            final pokemonEx = PokemonEx(
              base: pokemon,
              evolutions: evolutions,
              abilities: abilities,
            );
            if (mounted)
              state =
                  state.copyWith(asyncPokemonEx: AsyncValue.data(pokemonEx));
          } on Exception catch (error) {
            if (mounted)
              state = state.copyWith(
                asyncPokemonEx: AsyncValue.error(error),
                asyncMoveList: AsyncValue.error(error),
              );
          }
        },
      );
    }
  }

  Future<List<List<Pokemon>>> fetchEvolutions(
      List<Pokemon> pokemonList, int pokemonId) async {
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
        return pokemonList.firstWhere((pokemon) {
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
      final pokemon = state.pokemon;
      final moveList = _read(moveListByPokemonProvider(pokemon.id)).data?.value;
      if (moveList != null) {
        final filtered = moveList.where((move) {
          return hiraToKana(move.nameJp).contains(hiraToKana(input));
        }).toList();
        if (mounted)
          state = state.copyWith(asyncMoveList: AsyncValue.data(filtered));
      }
    }
  }
}
