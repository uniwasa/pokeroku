import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/type_list_provider.dart';

final moveListByPokemonProvider =
    FutureProvider.autoDispose.family<List<Move>, int>((ref, pokemonId) async {
  ref.onDispose(() => print('bye from moveListByPokemonProvider'));
  final typeList = await ref.watch(typeListProvider.future);
  return ref
      .read(pokedexDataSourceProvider)
      .getMoveListByPokemon(pokemonId: pokemonId, typeList: typeList);
});
