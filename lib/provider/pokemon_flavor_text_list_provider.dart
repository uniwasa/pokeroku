import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon_flavor_text.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final pokemonFlavorTextProvider = FutureProvider.autoDispose
    .family<List<PokemonFlavorText>, int>((ref, pokemonId) async {
  ref.onDispose(() => print('bye from pokemonFlavorTextProvider'));
  return ref
      .read(pokedexDataSourceProvider)
      .getPokemonFlavorTextList(pokemonId);
});
