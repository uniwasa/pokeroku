import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/type_list_provider.dart';

final pokemonListByMoveProvider =
    FutureProvider.autoDispose.family<List<Pokemon>, int>((ref, moveId) async {
  ref.onDispose(() => print('bye from pokemonListByMoveProvider'));
  final typeList = await ref.watch(typeListProvider.future);
  return ref
      .read(pokedexDataSourceProvider)
      .getPokemonListByMove(moveId: moveId, typeList: typeList);
});
