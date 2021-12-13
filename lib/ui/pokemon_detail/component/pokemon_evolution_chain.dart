import 'package:flutter/material.dart';
import 'package:pokeroku/model/pokemon_detail_state.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/util.dart';

class PokemonEvolutionChain extends StatelessWidget {
  PokemonEvolutionChain({required PokemonDetailState pokemonDetailState})
      : _pokemonDetailState = pokemonDetailState;

  final PokemonDetailState _pokemonDetailState;

  @override
  Widget build(BuildContext context) {
    final evolutionLine = _pokemonDetailState.asyncEvolutionLine.data?.value;
    if (evolutionLine == null) return Container();
    List<Widget> evolutionsWidget = [];
    for (final stage in evolutionLine) {
      final stageWidget = Expanded(
        flex: stage.length < 5 ? 3 : 10,
        child: Center(
          child: Wrap(
            children: stage.map((stagePokemon) {
              final Image pokemonImage = Image.asset(
                stagePokemon.imageName,
                isAntiAlias: true,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
                width: double.infinity,
              );
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 84.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        final currentPokemon = _pokemonDetailState.pokemon;
                        if (currentPokemon != stagePokemon)
                          Navigator.pushNamed(context, Routes.pokemonDetail,
                              arguments: stagePokemon);
                      },
                      child: Padding(
                        child: pokemonImage,
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            alignment: WrapAlignment.start,
          ),
        ),
      );
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderLabel(
              color:
                  _pokemonDetailState.pokemon.firstType?.color ?? Colors.grey,
              text: '進化'),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: evolutionsWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
