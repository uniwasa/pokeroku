import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

class PokemonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final pokemonImage = Image.asset(
    //   'assets/images/regular/venusaur.png',
    //   alignment: Alignment(20, 20),
    // );
    return Scaffold(
      body: Container(
        color: Theme.of(context).cardColor,
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   flexibleSpace: FlexibleSpaceBar(
            //     background: Image.asset(
            //       'assets/icons/pokemon/regular/' + name + '.png',
            //       isAntiAlias: true,
            //       fit: BoxFit.fitHeight,
            //       filterQuality: FilterQuality.none,
            //     ),
            //     stretchModes: [],
            //   ),
            //   floating: true,
            //   pinned: true,
            //   expandedHeight: 200,
            //   // backgroundColor: Colors.green,
            //   onStretchTrigger: () async {
            //     print('hello');
            //   },
            // ),
            HookBuilder(builder: (context) {
              final currentPokemon = useProvider(currentPokemonProvider);
              final pokemon = currentPokemon.pokemon;
              if (pokemon == null) return SliverAppBar(); //空のSliverAppBar
              return SliverPadding(
                padding: EdgeInsets.only(bottom: 0.0),
                sliver: SliverPersistentHeader(
                  delegate: PokemonSliverDelegate(pokemon: pokemon),
                  pinned: true,
                ),
              );
            }),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, __) {
                return Container(
                  child: Column(
                    children: List.generate(
                        20,
                        (index) => Container(
                            child: ListTile(title: Text("$index nothing")))),
                  ),
                );
              }, childCount: 1),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // context
          //     .read(pokemonViewModelProvider)
          //     .setName('dragapult'); //context.read使わんでもいいかも
          context.read(currentPokemonProvider).fetchPokemon(887);
        },
      ),
    );
  }
}

class PokemonSliverDelegate extends SliverPersistentHeaderDelegate {
  PokemonSliverDelegate({required Pokemon pokemon}) : _pokemon = pokemon;

  Pokemon _pokemon;
  double roundedContainerHeight = 60;

  @override
  double get maxExtent => 380;

  @override
  double get minExtent => 163;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = max(0.0, 1 - shrinkOffset / (maxExtent - minExtent));
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: maxExtent,
          decoration: BoxDecoration(
            color: _pokemon.color,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: roundedContainerHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        Positioned(
          // top: 0,
          bottom: 0,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Hero(
                tag: _pokemon.speciesIdentifier,
                child: Image.asset(
                  'assets/icons/pokemon/regular/' +
                      _pokemon.speciesIdentifier +
                      '.png',
                  isAntiAlias: true,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  width: MediaQuery.of(context).size.width,
                  // height: maxExtent,
                ),
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _pokemon.nameJp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                onPressed: () => {})
          ],
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
