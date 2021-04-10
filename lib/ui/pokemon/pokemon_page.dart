import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

class PokemonPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // print('wooooo');
    final pokemonViewModel = useProvider(pokemonViewModelProvider);
    final name = pokemonViewModel.name;

    // final pokemonImage = Image.asset(
    //   'assets/images/regular/venusaur.png',
    //   alignment: Alignment(20, 20),
    // );
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/icons/pokemon/regular/' + name + '.png',
                isAntiAlias: true,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.none,
              ),
              stretchModes: [],
            ),
            floating: true,
            pinned: true,
            expandedHeight: 200,
            backgroundColor: Colors.green,
            onStretchTrigger: () async {
              print('hello');
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Image.asset(
                  'assets/icons/pokemon/regular/venusaur.png',
                  isAntiAlias: true,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  height: 200,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // context
          //     .read(pokemonViewModelProvider)
          //     .setName('dragapult'); //context.read使わんでもいいかも
          context.read(pokemonNameProvider).state = 'dragapult';
        },
      ),
    );
  }
}
