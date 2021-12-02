import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_info_state.dart';
import 'package:pokeroku/model/pokemon.dart';

class AbilityInfoViewModel extends StateNotifier<AbilityInfoState> {
  AbilityInfoViewModel({
    required Ability ability,
    required AsyncValue<List<Pokemon>> asyncPokemonList,
  }) : super(AbilityInfoState(
            ability: ability, asyncPokemonList: asyncPokemonList)) {
    init();
  }

  Future<void> init() async {}
}
