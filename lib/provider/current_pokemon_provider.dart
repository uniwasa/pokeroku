import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

// final currentPokemonProvider = StateNotifierProvider<CurrentPokemon>((ref) {
//   return CurrentPokemon(dataSource: ref.read(pokedexDataSourceProvider));
// });
//
// class CurrentPokemon extends StateNotifier<Pokemon?> {
//   CurrentPokemon({required PokedexDataSource dataSource})
//       : _dataSource = dataSource,
//         super(null);
//
//   final PokedexDataSource _dataSource;
//
//   Future<void> fetchPokemon(int id) async {
//     final pokemon = await _dataSource.getPokemon(id);
//     state = pokemon;
//   }
//
//   void setPokemon(Pokemon pokemon) {
//     state = pokemon;
//   }
// }

final currentPokemonProvider = StateProvider<Pokemon?>((ref) => null);
