import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/util.dart';

final allPokemonsProvider = StateNotifierProvider<AllPokemons>((ref) {
  return AllPokemons(dataSource: ref.read(pokedexDataSourceProvider));
});

class AllPokemons extends StateNotifier<AsyncValue<List<Pokemon>>> {
  final PokedexDataSource _dataSource;

  AllPokemons({required PokedexDataSource dataSource})
      : _dataSource = dataSource,
        super(const AsyncValue.loading()) {
    fetchInitialPokemons();
  }

  Future<void> fetchInitialPokemons() async {
    try {
      state = AsyncValue.loading();
      final pokemons = await _dataSource.getPokemons();
      state = AsyncValue.data(pokemons);
    } on Exception catch (error) {
      state = AsyncValue.error(error);
    }
  }
}

final pokedexViewModelProvider = StateNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(pokemons: ref.watch(allPokemonsProvider.state));
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
