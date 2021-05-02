import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pokeroku/model/pokedex/pokemon.dart';

class PokemonStatsChart extends StatelessWidget {
  PokemonStatsChart({required Pokemon pokemon}) : _pokemon = pokemon;

  Pokemon _pokemon;

  Color barColor(int value) {
    if (value < 60) {
      return Colors.deepOrange;
    } else if (value < 100) {
      return Colors.yellow;
    } else if (value < 130) {
      return Colors.lightGreenAccent;
    } else {
      return Colors.blue;
    }
  }

  final Color barBackgroundColor = const Color(0xff555555);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BarChart(
                      mainBarData(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          colors: [barColor(y.toInt())],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 200,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        6,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, _pokemon.hp.toDouble());
            case 1:
              return makeGroupData(1, _pokemon.attack.toDouble());
            case 2:
              return makeGroupData(2, _pokemon.defense.toDouble());
            case 3:
              return makeGroupData(3, _pokemon.specialAttack.toDouble());
            case 4:
              return makeGroupData(4, _pokemon.specialDefense.toDouble());
            case 5:
              return makeGroupData(5, _pokemon.speed.toDouble());
            default:
              return makeGroupData(0, 0.0);
          }
        },
      );

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '体力';
              case 1:
                return '攻撃';
              case 2:
                return '防御';
              case 3:
                return '特攻';
              case 4:
                return '特防';
              case 5:
                return '素早';
              default:
                return '';
            }
          },
        ),
        topTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          margin: 10,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return _pokemon.hp.toString();
              case 1:
                return _pokemon.attack.toString();
              case 2:
                return _pokemon.defense.toString();
              case 3:
                return _pokemon.specialAttack.toString();
              case 4:
                return _pokemon.specialDefense.toString();
              case 5:
                return _pokemon.speed.toString();
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}
