import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/item.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final itemListProvider = FutureProvider<List<Item>>((ref) async {
  return ref.read(pokedexDataSourceProvider).getItemList();
});
