import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/component/pixel_image.dart';
import 'package:pokeroku/ui/component/serch_field.dart';
import 'package:pokeroku/ui/pokemon_selection/pokemon_selection_view_model.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class PokemonSelectionPage extends StatelessWidget {
  PokemonSelectionPage({Key? key, required String? teamId})
      : _teamId = teamId,
        super(key: key);

  final String? _teamId;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final asyncValue =
          ref.watch(pokemonSelectionViewModelProviderFamily(_teamId));

      return Scaffold(
        appBar: AppBar(
          title: Text('ポケモン選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (pokemonList) {
                return Column(
                  children: [
                    SearchField(
                      callback: (final text) {
                        final provider = ref.read(
                            pokemonSelectionViewModelProviderFamily(_teamId)
                                .notifier);
                        provider.searchForText(text);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: pokemonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final pokemon = pokemonList[index];
                          final pokemonImage = PixelImage(pokemon.imageName);

                          return ListTile(
                            leading: pokemonImage,
                            title: Text(pokemon.fullNameJp),
                            onTap: () {
                              if (_teamId != null) {
                                // パーティ画面用
                                ref
                                    .read(teamEditViewModelProviderFamily(
                                            _teamId!)
                                        .notifier)
                                    .addBuild(pokemon: pokemon);
                              } else {
                                // ポケモン単体画面用
                                // TODO: ポケモン単体画面用
                              }
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
