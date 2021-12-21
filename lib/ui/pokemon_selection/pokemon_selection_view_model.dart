import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/eligible_pokemon_list_provider.dart';
import 'package:pokeroku/util.dart';

final pokemonSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<PokemonSelectionViewModel, AsyncValue<List<Pokemon>>, String?>(
        (ref, teamId) {
  return PokemonSelectionViewModel(
    read: ref.read,
    pokemonList: ref.watch(eligiblePokemonListProvider),
    teamId: teamId,
  );
});

class PokemonSelectionViewModel
    extends StateNotifier<AsyncValue<List<Pokemon>>> {
  PokemonSelectionViewModel({
    required Reader read,
    required AsyncValue<List<Pokemon>> pokemonList,
    required String? teamId,
  })  : _read = read,
        _pokemonList = pokemonList,
        _teamId = teamId,
        super(pokemonList) {
    init();
  }

  final Reader _read;
  final AsyncValue<List<Pokemon>> _pokemonList;
  final String? _teamId;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}

  void searchForText(String input) {
    _read(eligiblePokemonListProvider).whenData((pokemonList) {
      final filtered = pokemonList.where((pokemon) {
        return hiraToKana(pokemon.nameJp).contains(hiraToKana(input));
      }).toList();
      state = AsyncValue.data(filtered);
    });
  }
}
