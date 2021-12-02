import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';

final evolutionLineProvider = FutureProvider.autoDispose
    .family<List<List<Pokemon>>, int>((ref, pokemonId) async {
  ref.onDispose(() => print('bye from evolutionLineProvider'));
  final pokemonList = await ref.watch(pokemonListProvider.future);
  return ref
      .read(pokedexDataSourceProvider)
      .getEvolutionLine(pokemonId: pokemonId, pokemonList: pokemonList);
});
