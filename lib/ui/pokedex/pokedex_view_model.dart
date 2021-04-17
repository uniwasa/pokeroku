import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/provider/pokedex_data_source_provider.dart';
import 'package:sqlite_example/state/pokedex_state.dart';

final pokedexViewModelProvider = StateNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(dataSource: ref.read(pokedexDataSourceProvider));
});

class PokedexViewModel extends StateNotifier<PokedexState> {
  final PokedexDataSource _dataSource;

  PokedexViewModel({required PokedexDataSource dataSource})
      : _dataSource = dataSource,
        super(const PokedexState());

  Future<void> fetchDefaultPokemons() async {
    final pokemons = await _dataSource.getPokemons();
    state = state.copyWith(pokemons: pokemons);
  }
}
