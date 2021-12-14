import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';
import 'package:pokeroku/provider/move_list_by_pokemon_provider.dart';
import 'package:pokeroku/util.dart';

class PokemonDetailViewModel extends StateNotifier<PokemonDetailState> {
  PokemonDetailViewModel({
    required Reader read,
    required Pokemon pokemon,
    required AsyncValue<List<Move>> asyncMoveList,
    required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
    required AsyncValue<List<Ability>> asyncAbilityList,
    required AsyncValue<List<List<Pokemon>>> asyncEvolutionLine,
  })  : _read = read,
        super(PokemonDetailState(
          pokemon: pokemon,
          asyncMoveList: asyncMoveList,
          asyncPokemonFlavorTextList: asyncPokemonFlavorTextList,
          asyncAbilityList: asyncAbilityList,
          asyncEvolutionLine: asyncEvolutionLine,
        )) {
    init();
  }

  final Reader _read;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}

  void searchForMoves(String input) {
    if (mounted) {
      final pokemon = state.pokemon;
      final moveList = _read(moveListByPokemonProvider(pokemon.id)).value;
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
