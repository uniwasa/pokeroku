import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokedex/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/state/pokedex_state.dart';
import 'package:pokeroku/util.dart';

final pokedexViewModelProvider = StateNotifierProvider<PokedexViewModel>((ref) {
  return PokedexViewModel(dataSource: ref.read(pokedexDataSourceProvider));
});

class PokedexViewModel extends StateNotifier<PokedexState> {
  final PokedexDataSource _dataSource;
  List<Pokemon>? initialPokemons;

  PokedexViewModel({required PokedexDataSource dataSource})
      : _dataSource = dataSource,
        super(const PokedexState());

  Future<void> fetchInitialPokemons() async {
    final pokemons = await _dataSource.getPokemons();
    initialPokemons = pokemons;
    state = state.copyWith(pokemons: pokemons);
  }

  void searchForText(String input) {
    final pokemons = initialPokemons;
    if (pokemons != null) {
      final filtered = pokemons.where((pokemon) {
        return hiraToKana(pokemon.nameJp).contains(hiraToKana(input));
      }).toList();
      state = state.copyWith(pokemons: filtered);
    }
  }
}
