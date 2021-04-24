import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/ui/pokedex/pokedex_view_model.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

import '../../routes.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初回ポケモン取得
    context.read(pokedexViewModelProvider).fetchDefaultPokemons();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: HookBuilder(builder: (context) {
        // final pokemons = useProvider(
        //     pokedexViewModelProvider.select((value) => value.pokemons));
        final pokemonState = useProvider(pokedexViewModelProvider.state);
        final pokemons = pokemonState.pokemons;
        //ポケモンまだ読み込まれてないなら
        if (pokemons == null) return ListView();
        //ポケモン読み込まれてたら
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final pokemon = pokemons[index];
            // final isPrevGenIcon = pokemon.gen8!.forms!['\$']!.isPrevGenIcon!;
            final Image pokemonImage = Image.asset(
              'assets/icons/pokemon/regular/' +
                  pokemon.speciesIdentifier +
                  '.png',
              // scale: isPrevGenIcon ? 0.8 : 1,
              isAntiAlias: true,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none,
            );
            final listTile = ListTile(
              leading: Container(
                width: 68,
                height: 56,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Hero(
                        tag: pokemon.speciesIdentifier,
                        child: pokemonImage,
                      ),
                    ),
                  ],
                ),
              ),
              // leading: Text(pokemon.id!.toString()),
              title: Text(
                pokemon.nameJp,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                context.read(currentPokemonProvider).setPokemon(pokemon);
                Navigator.pushNamed(context, Routes.pokemon);
              },
            );
            return listTile;
          },
          itemCount: pokemons.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.read(pokedexViewModelProvider).fetchDefaultPokemons();
        },
      ),
    );
  }
}
