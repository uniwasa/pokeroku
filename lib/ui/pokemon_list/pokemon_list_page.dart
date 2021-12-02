import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/pokemon_list/pokemon_list_view_model.dart';

import '../../routes.dart';
import '../../util.dart';

class PokemonListPage extends StatelessWidget {
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
              final provider =
                  context.read(pokemonListViewModelProvider.notifier);
              provider.searchForText(text);
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
        final pokemonState = useProvider(pokemonListViewModelProvider);
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
                            Navigator.pushNamed(context, Routes.pokemonDetail,
                                arguments: pokemon);
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
                                        if (pokemon.firstType != null)
                                          buildCircle(
                                              color: pokemon.firstType!.color),
                                        if (pokemon.secondType != null)
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: buildCircle(
                                              color: pokemon.secondType!.color,
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
        onPressed: () async {},
      ),
    );
  }
}
