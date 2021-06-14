part of '../pokeinfo_page.dart';

extension TabContentMove on PokeinfoPage {
  List<Widget> buildTabContentMove(
      {required BuildContext context,
      required AsyncValue<List<Move>> asyncMoves}) {
    return asyncMoves.when(
      data: (moves) {
        return [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text(moves[index].nameJp));
              },
              childCount: moves.length,
            ),
          )
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
