import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/provider/type_list_provider.dart';

final moveListProvider = FutureProvider<List<Move>>((ref) async {
  final typeList = await ref.watch(typeListProvider.future);
  return ref.read(pokedexDataSourceProvider).getMoveList(typeList: typeList);
});
