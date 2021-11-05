import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_edit_state.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

final pokemonSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<PokemonSelectionViewModel, AsyncValue<List<Pokemon>>,
        BuildManager>((ref, pokemonListManager) {
  return PokemonSelectionViewModel(
    pokemonList: ref.watch(allPokemonsProvider),
    pokemonListManager: pokemonListManager,
  );
});

class PokemonSelectionViewModel
    extends StateNotifier<AsyncValue<List<Pokemon>>> {
  PokemonSelectionViewModel({
    required AsyncValue<List<Pokemon>> pokemonList,
    required BuildManager pokemonListManager,
  })  : _pokemonList = pokemonList,
        _pokemonListManager = pokemonListManager,
        super(pokemonList) {
    init();
  }

  final AsyncValue<List<Pokemon>> _pokemonList;
  final BuildManager _pokemonListManager;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}
}
