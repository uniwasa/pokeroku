part of '../pokeinfo_page.dart';

extension TabContentEvolution on PokeinfoPage {
  List<Widget> buildTabContentEvolution(
      {required BuildContext context, required PokemonEx pokemonEx}) {
    List<Widget> evolutionsWidget = [];
    for (final stage in pokemonEx.evolutions) {
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
                        Navigator.pushNamed(context, Routes.pokeinfo,
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

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: evolutionsWidget,
                ),
              ),
            ),
          ),
        ),
      )
    ];
  }
}
