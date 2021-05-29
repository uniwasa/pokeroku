import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';

class TabContentEvolution extends StatelessWidget {
  TabContentEvolution({required PokemonEx pokemonEx}) : _pokemonEx = pokemonEx;
  final PokemonEx _pokemonEx;
  @override
  Widget build(BuildContext context) {
    List<Widget> evolutionsWidget = [];
    for (final stage in _pokemonEx.evolutions) {
      final stageWidget = Expanded(
          flex: stage.length < 5 ? 3 : 10,
          child: Container(
            child: Center(
              child: Wrap(
                children: stage.map((stagePokemon) {
                  final Image pokemonImage = Image.asset(
                    stagePokemon.imageName,
                    isAntiAlias: true,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.none,
                    width: stage.length < 5 ? double.infinity : null,
                  );
                  return InkWell(
                    onTap: () {
                      context
                          .read(currentPokemonProvider.notifier)
                          .setPokemon(stagePokemon);
                    },
                    child: Padding(
                      child: pokemonImage,
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  );
                }).toList(),
                alignment: WrapAlignment.start,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ));
      evolutionsWidget.add(stageWidget);
      evolutionsWidget.add(
        Expanded(
          flex: 1,
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 32,
          ),
        ),
      );
    }
    evolutionsWidget.removeLast();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: evolutionsWidget,
    );
  }
}
