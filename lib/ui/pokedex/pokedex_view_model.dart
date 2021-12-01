import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/util.dart';

final pokedexViewModelProvider =
    StateNotifierProvider<PokedexViewModel, AsyncValue<List<Pokemon>>>((ref) {
  return PokedexViewModel(pokemonList: ref.watch(pokemonListProvider));
});

class PokedexViewModel extends StateNotifier<AsyncValue<List<Pokemon>>> {
  final AsyncValue<List<Pokemon>> _pokemonList;

  PokedexViewModel({required AsyncValue<List<Pokemon>> pokemonList})
      : _pokemonList = pokemonList,
        super(pokemonList);

  void searchForText(String input) {
    _pokemonList.when(
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
