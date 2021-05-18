import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/ui/pokedex/pokedex_view_model.dart';

import '../../routes.dart';
import '../../util.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Container(
            width: kToolbarHeight,
            child: Icon(Icons.filter_alt),
          ),
        ],
        title: Container(
          height: kToolbarHeight - 16,
          child: TextField(
            onChanged: (text) {
              final pokedexViewModel = context.read(pokedexViewModelProvider);
              pokedexViewModel.searchForText(text);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.black,
              filled: true,
            ),
          ),
        ),
      ),
      body: HookBuilder(builder: (context) {
        // return Container();
        // final pokemons = useProvider(
        //     pokedexViewModelProvider.select((value) => value.pokemons));
        final pokemonState = useProvider(pokedexViewModelProvider.state);
        return pokemonState.when(
          data: (pokemons) {
            //ポケモン読み込まれてたら
            return GridView.builder(
              padding: EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                final pokemon = pokemons[index];
                // final isPrevGenIcon = pokemon.gen8!.forms!['\$']!.isPrevGenIcon!;
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

                return Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        color: Theme.of(context).cardColor,
                        child: InkWell(
                          onTap: () {
                            context
                                .read(currentPokemonProvider)
                                .setPokemon(pokemon);
                            Navigator.pushNamed(context, Routes.pokeinfo);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // color: pokemon.color,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: AspectRatio(
                                    aspectRatio: 1.25,
                                    child: pokemonHeroImage,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        pokemon.nameJp,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      if (pokemon.formNameJp != null)
                                        Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            pokemon.formNameJp!,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  // Text(
                                  //   pokemon.fullNameEn,
                                  //   style: TextStyle(
                                  //     color: Colors.white70,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8,
                                  right: 8,
                                  bottom: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '#' +
                                          pokemon.speciesId
                                              .toString()
                                              .padLeft(3, "0"),
                                      style: TextStyle(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        buildCircle(
                                            color: pokemon.firstTypeColor),
                                        if (pokemon.secondTypeColor != null)
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: buildCircle(
                                              color: pokemon.secondTypeColor!,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
              itemCount: pokemons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5,
              ),
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // context.read(pokedexViewModelProvider).fetchInitialPokemons();
        },
      ),
    );
  }
}
