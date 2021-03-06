import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/util.dart';

final pokemonListViewModelProvider =
    StateNotifierProvider<PokemonListViewModel, AsyncValue<List<Pokemon>>>(
        (ref) {
  return PokemonListViewModel(
      read: ref.read, pokemonList: ref.watch(pokemonListProvider));
});

class PokemonListViewModel extends StateNotifier<AsyncValue<List<Pokemon>>> {
  PokemonListViewModel({
    required AsyncValue<List<Pokemon>> pokemonList,
    required Reader read,
  })  : _read = read,
        super(pokemonList);

  final Reader _read;

  void searchForText(String input) {
    _read(pokemonListProvider).when(
      data: (pokemonList) {
        final filtered = pokemonList.where((pokemon) {
          return hiraToKana(pokemon.nameJp).contains(hiraToKana(input));
        }).toList();
        state = AsyncValue.data(filtered);
      },
      loading: () {
        state = AsyncValue.loading();
      },
      error: (error, _) {
        state = AsyncValue.error(error);
      },
    );
  }
}
