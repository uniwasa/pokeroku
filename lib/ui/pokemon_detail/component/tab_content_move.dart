part of '../pokemon_detail_page.dart';

extension TabContentMove on PokemonDetailPage {
  List<Widget> buildTabContentMove({
    required BuildContext context,
    required WidgetRef ref,
    required AsyncValue<List<Move>> asyncMoveList,
  }) {
    return asyncMoveList.when(
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
              color: Theme.of(context).canvasColor,
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
                  final move = moves[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.moveDetail,
                          arguments: move,
                        );
                      },
                      child: MoveListTile(move: move, isDetailPage: true),
                    ),
                  );
                },
                childCount: moves.length,
              ),
            ),
          );
        }).toList();

        // コンテンツ本体
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: TextField(
                onChanged: (text) {
                  final provider = ref.read(_provider.notifier);
                  provider.searchForMoves(text);
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
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
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
