import 'dart:io';
import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqlite_example/model/pokedex/pokemon.dart';
import 'package:sqlite_example/ui/pokemon/pokemon_view_model.dart';

class PokemonPage extends StatelessWidget {
  final List<String> _tabs = <String>[
    "Featured",
    "Popular",
    "Latest",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            color: Theme.of(context).cardColor,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool? innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)!,
                    sliver: SliverSafeArea(
                      top: false,
                      bottom: Platform.isIOS ? false : true,
                      sliver: HookBuilder(builder: (context) {
                        final currentPokemon =
                            useProvider(currentPokemonProvider);
                        final pokemon = currentPokemon.pokemon;
                        if (pokemon == null)
                          return SliverAppBar(); //空のSliverAppBar
                        return SliverPadding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          sliver: SliverPersistentHeader(
                            delegate: PokemonSliverDelegate(
                              pokemon: pokemon,
                              tabBar: TabBar(
                                tabs: _tabs
                                    .map((String name) => Tab(text: name))
                                    .toList(),
                              ),
                            ),
                            pinned: true,
                          ),
                        );
                      }),
                    ),
                  )
                ];
              },
              innerScrollPositionKeyBuilder: () {
                return Key('Tab${DefaultTabController.of(context)!.index}');
              },
              body: TabBarView(
                children: _tabs.asMap().entries.map((entry) {
                  return TabViewItem(
                    tabKey: Key('Tab${entry.key}'),
                    tabName: entry.value,
                  );
                }).toList(),
              ),
            ),
            // child: CustomScrollView(
            //   slivers: <Widget>[
            //     HookBuilder(builder: (context) {
            //       final currentPokemon = useProvider(currentPokemonProvider);
            //       final pokemon = currentPokemon.pokemon;
            //       if (pokemon == null) return SliverAppBar(); //空のSliverAppBar
            //       return SliverPadding(
            //         padding: EdgeInsets.only(bottom: 0.0),
            //         sliver: SliverPersistentHeader(
            //           delegate: PokemonSliverDelegate(pokemon: pokemon),
            //           pinned: true,
            //         ),
            //       );
            //     }),
            //     SliverList(
            //       delegate: SliverChildBuilderDelegate((_, __) {
            //         return Container(
            //           child: Column(
            //             children: List.generate(
            //               100,
            //               (index) => Container(
            //                 child: ListTile(
            //                   title: Text("$index nothing"),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       }, childCount: 1),
            //     )
            //   ],
            // ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // context
              //     .read(pokemonViewModelProvider)
              //     .setName('dragapult'); //context.read使わんでもいいかも
              // context.read(currentPokemonProvider).fetchPokemon(887);
              print(DefaultTabController.of(context)?.index);
            },
          ),
        );
      }),
    );
  }
}

class PokemonSliverDelegate extends SliverPersistentHeaderDelegate {
  PokemonSliverDelegate({required Pokemon pokemon, required TabBar tabBar})
      : _pokemon = pokemon,
        _tabBar = tabBar;

  Pokemon _pokemon;
  TabBar _tabBar;
  double roundedContainerHeight = 60;

  @override
  double get maxExtent => 380;

  @override
  double get minExtent => 163; //ステータスバーの高さとか計算した結果

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = max(0.0, 1 - shrinkOffset / (maxExtent - minExtent));
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: maxExtent,
          decoration: BoxDecoration(
            color: _pokemon.color,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: roundedContainerHeight,
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
        Positioned(
          left: 0,
          bottom: 0,
          height: roundedContainerHeight,
          width: MediaQuery.of(context).size.width,
          child: _tabBar,
        ),
        Positioned(
          // top: 0,
          bottom: 0,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Hero(
                tag: _pokemon.speciesIdentifier,
                child: Image.asset(
                  'assets/icons/pokemon/regular/' +
                      _pokemon.speciesIdentifier +
                      '.png',
                  isAntiAlias: true,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  width: MediaQuery.of(context).size.width,
                  // height: maxExtent,
                ),
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _pokemon.nameJp,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                onPressed: () => {})
          ],
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TabViewItem extends StatefulWidget {
  final Key tabKey;
  final String tabName;

  const TabViewItem({Key? key, required this.tabKey, required this.tabName})
      : super(key: key);

  @override
  _TabViewItemState createState() => _TabViewItemState();
}

class _TabViewItemState extends State<TabViewItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              return true;
            },
            child: NestedScrollViewInnerScrollPositionKeyWidget(
              widget.tabKey,
              CustomScrollView(
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)!,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: double.infinity,
                                color: Colors.blueGrey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('${widget.tabName} $index')
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          );
                        },
                        childCount: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
