import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_info_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

class AbilityInfoViewModel extends StateNotifier<AbilityInfoState> {
  AbilityInfoViewModel({
    required PokedexDataSource dataSource,
    required Ability ability,
  })  : _dataSource = dataSource,
        super(AbilityInfoState(
            ability: ability, asyncPokemons: AsyncValue.loading())) {
    //ポケモン一覧が読み込まれてるときのみ実行
    fetchPokemons();
  }

  final PokedexDataSource _dataSource;

  Future<void> setAbility(Ability ability) async {
    state =
        state.copyWith(ability: ability, asyncPokemons: AsyncValue.loading());
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    try {
      final abilityId = state.ability.id;
      final pokemons = await _dataSource.getAbilityPokemons(abilityId);
      state = state.copyWith(asyncPokemons: AsyncValue.data(pokemons));
    } on Exception catch (error) {
      state = state.copyWith(asyncPokemons: AsyncValue.error(error));
    }
  }
}
