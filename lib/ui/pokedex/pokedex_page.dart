import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/ui/pokedex/pokedex_view_model.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

import '../../routes.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final pokedexViewModel = useProvider(pokedexViewModelProvider);
    // pokedexViewModel.fetchDefaultPokemons();
    // final pokemons =
    //     useProvider(pokedexViewModelProvider.select((value) => value.pokemons));
    //
    // if (pokemons == null) return Scaffold();
    // final pokemonImage = Image.asset(
    //   'assets/images/regular/venusaur.png',
    //   alignment: Alignment(20, 20),
    // );
    print('gakgaklg;j');
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: HookBuilder(builder: (context) {
        final pokedexViewModel = context.read(pokedexViewModelProvider);
        pokedexViewModel.fetchDefaultPokemons();
        final pokemons = useProvider(
            pokedexViewModelProvider.select((value) => value.pokemons));
        //ポケモンまだ読み込まれてないなら
        if (pokemons == null) return ListView();
        //ポケモン読み込まれてたら
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final pokemeon = pokemons[index];
            // final isPrevGenIcon = pokemeon.gen8!.forms!['\$']!.isPrevGenIcon!;
            final Image pokemonImage = Image.asset(
              'assets/icons/pokemon/regular/' + pokemeon.identifier! + '.png',
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
                        tag: pokemeon.identifier!,
                        child: pokemonImage,
                      ),
                    ),
                  ],
                ),
              ),
              // leading: Text(pokemeon.id!.toString()),
              title: Text(
                pokemeon.identifier!,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // final pokemonViewModel = context.read(pokemonViewModelProvider);
                // pokemonViewModel.setName(pokemeon.identifier!);
                context.read(pokemonNameProvider).state = pokemeon.identifier!;
                Navigator.pushNamed(context, Routes.pokemon);
              },
            );
            return listTile;
          },
          itemCount: pokemons.length,
        );
      }),
      floatingActionButton: HookBuilder(builder: (context) {
        return FloatingActionButton(
          onPressed: () async {
            final pokedexViewModel = context.read(pokedexViewModelProvider);
            pokedexViewModel.fetchDefaultPokemons();
          },
        );
      }),
    );
  }
}
