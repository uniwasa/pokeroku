import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

class PokemonPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonViewModel = useProvider(pokemonViewModelProvider);
    final name = pokemonViewModel.name;

    // final pokemonImage = Image.asset(
    //   'assets/images/regular/venusaur.png',
    //   alignment: Alignment(20, 20),
    // );
    return Scaffold(
      body: Container(
        color: Theme.of(context).cardColor,
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   flexibleSpace: FlexibleSpaceBar(
            //     background: Image.asset(
            //       'assets/icons/pokemon/regular/' + name + '.png',
            //       isAntiAlias: true,
            //       fit: BoxFit.fitHeight,
            //       filterQuality: FilterQuality.none,
            //     ),
            //     stretchModes: [],
            //   ),
            //   floating: true,
            //   pinned: true,
            //   expandedHeight: 200,
            //   backgroundColor: Colors.green,
            //   onStretchTrigger: () async {
            //     print('hello');
            //   },
            // ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 0.0),
              sliver: SliverPersistentHeader(
                delegate: PokemonSliverDelegate(),
                pinned: true,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, __) {
                return Container(
                  color: Theme.of(context).cardColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      children: List.generate(
                          20,
                          (index) => Container(
                              child: ListTile(title: Text("$index nothing")))),
                    ),
                  ),
                );
              }, childCount: 1),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // context
          //     .read(pokemonViewModelProvider)
          //     .setName('dragapult'); //context.read使わんでもいいかも
          context.read(pokemonNameProvider).state = 'dragapult';
        },
      ),
    );
  }
}

class PokemonSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double rounded_container_height = 50;
    print(shrinkOffset);
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          width: MediaQuery.of(context).size.width,
          height: maxExtent,
          child: Container(
            height: maxExtent,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: maxExtent - rounded_container_height - shrinkOffset,
          child: Container(
            height: rounded_container_height + shrinkOffset,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        Image.asset(
          'assets/icons/pokemon/regular/' + 'dragapult' + '.png',
          // scale: isPrevGenIcon ? 0.8 : 1,
          isAntiAlias: true,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.none,
          height: maxExtent,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
