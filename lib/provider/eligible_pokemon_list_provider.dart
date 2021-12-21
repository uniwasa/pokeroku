import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';

final eligiblePokemonListProvider = FutureProvider<List<Pokemon>>((ref) async {
  final pokemonList = await ref.watch(pokemonListProvider.future);
  return ref
      .read(pokedexDataSourceProvider)
      .getEligiblePokemonList(pokemonList: pokemonList);
});
