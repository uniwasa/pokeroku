import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';

class AbilityDetailViewModel extends StateNotifier<AbilityDetailState> {
  AbilityDetailViewModel({
    required Ability ability,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
  }) : super(AbilityDetailState(
            ability: ability, asyncPokemonList: asyncPokemonList)) {
    init();
  }

  Future<void> init() async {}
}
