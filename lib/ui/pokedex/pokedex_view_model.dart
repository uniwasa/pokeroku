import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/util.dart';

final pokedexViewModelProvider = StateNotifierProvider<PokedexViewModel, AsyncValue<List<Pokemon>>>((ref) {
  return PokedexViewModel(pokemons: ref.watch(allPokemonsProvider));
});

class PokedexViewModel extends StateNotifier<AsyncValue<List<Pokemon>>> {
  final AsyncValue<List<Pokemon>> _allPokemons;

  PokedexViewModel({required AsyncValue<List<Pokemon>> pokemons})
      : _allPokemons = pokemons,
        super(pokemons);

  void searchForText(String input) {
    _allPokemons.when(
      data: (allPokemons) {
        final filtered = allPokemons.where((pokemon) {
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
    // _allPokemons.whenData((allPokemons) {
    //   final filtered = allPokemons.where((pokemon) {
    //     return hiraToKana(pokemon.nameJp).contains(hiraToKana(input));
    //   }).toList();
    //   state = AsyncValue.data(filtered);
    // });
  }
}
