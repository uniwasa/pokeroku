part of '../pokemon_detail_page.dart';

extension TabContentStats on PokemonDetailPage {
  List<Widget> buildTabContentStats(
      {required BuildContext context, required PokemonEx pokemonEx}) {
    return [
      SliverToBoxAdapter(
        child: PokemonStatsChart(pokemon: pokemonEx.base),
      )
    ];
  }
}
