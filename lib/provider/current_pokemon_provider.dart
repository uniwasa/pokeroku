import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/state/current_pokemon_state.dart';

final currentPokemonProvider = StateNotifierProvider<CurrentPokemon>((ref) {
  return CurrentPokemon(dataSource: ref.read(pokedexDataSourceProvider));
});

class CurrentPokemon extends StateNotifier<CurrentPokemonState> {
  CurrentPokemon({required PokedexDataSource dataSource})
      : _dataSource = dataSource,
        super(const CurrentPokemonState());

  final PokedexDataSource _dataSource;

  Future<void> fetchPokemon(int id) async {
    final pokemon = await _dataSource.getPokemon(id);
    state = state.copyWith(pokemon: pokemon);
  }

  void setPokemon(Pokemon pokemon) {
    state = state.copyWith(pokemon: pokemon);
  }
}
