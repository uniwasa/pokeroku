import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/ui/pokemon_selection/pokemon_selection_view_model.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class PokemonSelectionPage extends StatelessWidget {
  PokemonSelectionPage(
      {Key? key, required BuildManager pokemonListManager})
      : _pokemonListManager = pokemonListManager,
        super(key: key);

  final BuildManager _pokemonListManager;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue = useProvider(
          pokemonSelectionViewModelProviderFamily(_pokemonListManager));

      return Scaffold(
        appBar: AppBar(
          title: Text('ポケモン選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (pokemonList) {
                return ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pokemon = pokemonList[index];
                    final Image pokemonImage = Image.asset(
                      pokemon.imageName,
                      isAntiAlias: true,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.none,
                    );

                    return ListTile(
                      leading: pokemonImage,
                      title: Text(pokemon.fullNameJp),
                      onTap: () {
                        _pokemonListManager.addBuild(pokemon: pokemon);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Text(error.toString()),
              ),
            );
          },
        ),
      );
    });
  }
}
