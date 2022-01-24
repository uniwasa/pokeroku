import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final abilityListProvider = FutureProvider<List<Ability>>((ref) async {
  return ref.read(pokedexDataSourceProvider).getAbilityList();
});
