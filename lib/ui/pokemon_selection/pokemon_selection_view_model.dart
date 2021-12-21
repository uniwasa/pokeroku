import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/eligible_pokemon_list_provider.dart';

final pokemonSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<PokemonSelectionViewModel, AsyncValue<List<Pokemon>>, String?>(
        (ref, teamId) {
  return PokemonSelectionViewModel(
    pokemonList: ref.watch(eligiblePokemonListProvider),
    teamId: teamId,
  );
});

class PokemonSelectionViewModel
    extends StateNotifier<AsyncValue<List<Pokemon>>> {
  PokemonSelectionViewModel({
    required AsyncValue<List<Pokemon>> pokemonList,
    required String? teamId,
  })  : _pokemonList = pokemonList,
        _teamId = teamId,
        super(pokemonList) {
    init();
  }

  final AsyncValue<List<Pokemon>> _pokemonList;
  final String? _teamId;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}
}
