import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final pokemonListProvider = FutureProvider<List<Pokemon>>((ref) async {
  return ref.read(pokedexDataSourceProvider).getPokemonList();
});
