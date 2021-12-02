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
    required Pokemon pokemon,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
    required AsyncValue<List<Move>> asyncMoveList,
    required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
    required AsyncValue<List<Ability>> asyncAbilityList,
    required AsyncValue<List<List<Pokemon>>> asyncEvolutionLine,
  })  : _read = read,
        _pokemonList = asyncPokemonList,
        super(PokemonDetailState(
          pokemon: pokemon,
          asyncPokemonEx: AsyncValue.loading(),
          asyncMoveList: asyncMoveList,
          asyncPokemonFlavorTextList: asyncPokemonFlavorTextList,
          asyncAbilityList: asyncAbilityList,
          asyncEvolutionLine: asyncEvolutionLine,
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

            final pokemonEx = PokemonEx(
              base: pokemon,
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
