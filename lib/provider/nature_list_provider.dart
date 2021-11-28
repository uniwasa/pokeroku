import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/nature.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final natureListProvider = FutureProvider<List<Nature>>((ref) async {
  return ref.read(pokedexDataSourceProvider).getNatureList();
});
