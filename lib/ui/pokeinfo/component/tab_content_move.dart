part of '../pokeinfo_page.dart';

extension TabContentMove on PokeinfoPage {
  List<Widget> buildTabContentMove(
      {required BuildContext context,
      required AsyncValue<List<Move>> asyncMoves}) {
    return asyncMoves.when(
      data: (allMoves) {
        final movesLevel =
            allMoves.where((move) => move.pokemonMoveMethodId == 1).toList();
        final movesEgg =
            allMoves.where((move) => move.pokemonMoveMethodId == 2).toList();
        final movesTutor =
            allMoves.where((move) => move.pokemonMoveMethodId == 3).toList();
        final movesMachine =
            allMoves.where((move) => move.pokemonMoveMethodId == 4).toList();

        final moveGroup = {
          'レベル': movesLevel,
          'マシン': movesMachine,
          'タマゴ': movesEgg,
          '教え技': movesTutor,
        };
        final moveGroupSlivers = moveGroup.entries.map((e) {
          final key = e.key;
          final moves = e.value;
          return SliverStickyHeader(
            header: Container(
              height: 30.0,
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                key,
                style: const TextStyle(color: Colors.white54),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(title: Text(moves[index].nameJp));
                },
                childCount: moves.length,
              ),
            ),
          );
        }).toList();

        // コンテンツ本体
        return [
          useMemoized(
            () => SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: TextField(
                  onChanged: (text) {
                    final pokedexViewModel = context.read(_provider.notifier);
                    pokedexViewModel.searchForMoves(text);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Theme.of(context).canvasColor,
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          for (Widget sliver in moveGroupSlivers) sliver
        ];
      },
      loading: () => [
        SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
      error: (error, _) => [
        SliverFillRemaining(
          child: Center(
            child: Text(
              error.toString(),
            ),
          ),
        )
      ],
    );
  }
}
