import 'package:flutter/material.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/ui/pokeinfo/component/pokemon_stats_chart.dart';

class TabContentBase extends StatelessWidget {
  TabContentBase({required Pokemon pokemonBase, required PokemonEx pokemonEx})
      : _pokemonEx = pokemonEx,
        _pokemonBase = pokemonBase;
  final Pokemon _pokemonBase;
  final PokemonEx _pokemonEx;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, top: 4, right: 12, bottom: 12),
              child: Center(
                child: Text(
                  _pokemonEx.flavorTextJp.replaceAll(RegExp(r'\n'), ''),
                  style: TextStyle(
                      height: 2,
                      letterSpacing: 1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _pokemonBase.height.toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'm',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _pokemonBase.weight.toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'kg',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: _pokemonEx.genderRatio != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.male,
                      color: Colors.lightBlue,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _pokemonEx.genderRatio!.first.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.female,
                      color: Colors.pinkAccent,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _pokemonEx.genderRatio!.last.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Text('性別ふめい'),
        ),
        PokemonStatsChart(pokemon: _pokemonBase),
      ],
    );
  }
}
