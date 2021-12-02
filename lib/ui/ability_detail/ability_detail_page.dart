import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_detail_state.dart';
import 'package:pokeroku/provider/pokemon_list_by_ability_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_detail/ability_detail_view_model.dart';

class AbilityDetailPage extends StatelessWidget {
  AbilityDetailPage({Key? key, required Ability ability}) : super(key: key) {
    _provider = StateNotifierProvider.autoDispose<AbilityDetailViewModel,
        AbilityDetailState>((ref) {
      return AbilityDetailViewModel(
        ability: ability,
        asyncPokemonList: ref.watch(pokemonListByAbilityProvider(ability.id)),
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<AbilityDetailViewModel,
      AbilityDetailState> _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HookBuilder(builder: (context) {
        final ability = useProvider(_provider.select((value) => value.ability));
        final asyncPokemonList =
            useProvider(_provider.select((value) => value.asyncPokemonList));
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(ability.nameJp),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        ability.flavorTextJp.replaceAll(RegExp(r'\n'), ''),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            asyncPokemonList.when(
              data: (pokemons) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final pokemon = pokemons[index];
                    final Image pokemonImage = Image.asset(
                      pokemon.imageName,
                      isAntiAlias: true,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.none,
                    );
                    final pokemonHeroImage = Hero(
                      tag: pokemon.identifier,
                      child: pokemonImage,
                    );
                    return ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            pokemon.nameJp,
                            style: TextStyle(fontSize: 16),
                          ),
                          if (pokemon.formNameJp != null)
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                pokemon.formNameJp!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                        ],
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: pokemonHeroImage,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.pokemonDetail,
                            arguments: pokemon);
                      },
                    );
                  },
                  childCount: pokemons.length,
                ),
              ),
              loading: () => SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => SliverFillRemaining(
                child: Center(child: Text(error.toString())),
              ),
            ),
          ],
        );
      }),
    );
  }
}
