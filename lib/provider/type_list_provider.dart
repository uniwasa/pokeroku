import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon_type.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final typeListProvider = FutureProvider<List<PokemonType>>((ref) async {
  return ref.read(pokedexDataSourceProvider).getPokemonTypeList();
});
