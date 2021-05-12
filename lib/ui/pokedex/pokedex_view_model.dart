import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/util.dart';

final pokedexViewModelProvider = StateNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(dataSource: ref.read(pokedexDataSourceProvider));
});

class PokedexViewModel extends StateNotifier<AsyncValue<List<Pokemon>>> {
  final PokedexDataSource _dataSource;
  List<Pokemon>? initialPokemons;

  PokedexViewModel({required PokedexDataSource dataSource})
      : _dataSource = dataSource,
        super(const AsyncValue.loading()) {
    fetchInitialPokemons();
  }

  Future<void> fetchInitialPokemons() async {
    try {
      final pokemons = await _dataSource.getPokemons();
      initialPokemons = pokemons;
      state = AsyncValue.data(pokemons);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }

  void searchForText(String input) {
    try {
      final pokemons = initialPokemons;
      if (pokemons != null) {
        final filtered = pokemons.where((pokemon) {
          return hiraToKana(pokemon.nameJp).contains(hiraToKana(input));
        }).toList();
        state = AsyncValue.data(filtered);
      }
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}
