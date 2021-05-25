import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

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
