part of '../pokeinfo_page.dart';

extension TabContentStats on PokeinfoPage {
  List<Widget> buildTabContentStats(
      {required BuildContext context, required PokemonEx pokemonEx}) {
    return [
      SliverToBoxAdapter(
        child: PokemonStatsChart(pokemon: pokemonEx.base),
      )
    ];
  }
}
