import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_info_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/ability_info/ability_info_view_model.dart';

class AbilityInfoPage extends StatelessWidget {
  AbilityInfoPage({Key? key, required Ability ability}) : super(key: key) {
    _provider = StateNotifierProvider.autoDispose<AbilityInfoViewModel,
        AbilityInfoState>((ref) {
      return AbilityInfoViewModel(
        dataSource: ref.read(pokedexDataSourceProvider),
        ability: ability,
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<AbilityInfoViewModel,
      AbilityInfoState> _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HookBuilder(builder: (context) {
        final ability = useProvider(_provider.select((value) => value.ability));
        final asyncPokemons =
            useProvider(_provider.select((value) => value.asyncPokemons));
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
            asyncPokemons.when(
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
                      title: Text(pokemon.nameJp),
                      leading: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: pokemonHeroImage,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.pokeinfo,
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
