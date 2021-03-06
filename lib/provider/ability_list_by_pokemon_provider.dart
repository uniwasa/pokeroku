import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

final abilityListByPokemonProvider = FutureProvider.autoDispose
    .family<List<Ability>, int>((ref, pokemonId) async {
  ref.onDispose(() => print('bye from abilityListByPokemonProvider'));
  return ref.read(pokedexDataSourceProvider).getAbilityListByPokemon(pokemonId);
});
