part of '../pokemon_detail_page.dart';

extension TabContentStats on PokemonDetailPage {
  List<Widget> buildTabContentStats(
      {required BuildContext context,
      required PokemonDetailState pokemonDetailState}) {
    return [
      SliverToBoxAdapter(
        child: PokemonStatsChart(pokemon: pokemonDetailState.pokemon),
      )
    ];
  }
}
