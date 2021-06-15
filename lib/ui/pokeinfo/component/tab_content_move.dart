part of '../pokeinfo_page.dart';

extension TabContentMove on PokeinfoPage {
  List<Widget> buildTabContentMove(
      {required BuildContext context,
      required AsyncValue<List<Move>> asyncMoves}) {
    return asyncMoves.when(
      data: (moves) {
        return [
          useMemoized(
            () => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 10, right: 8, bottom: 5),
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
