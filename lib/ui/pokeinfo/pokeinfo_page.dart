import 'dart:io';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/ui/component/pokemon_header_sliver_delegate.dart';
import 'package:pokeroku/ui/component/pokemon_stats_chart.dart';
import 'package:pokeroku/ui/component/tab_view_item.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_view_model.dart';

class PokeinfoPage extends StatelessWidget {
  final List<String> _tabs = <String>[
    "きほん",
    "わざ",
    "そのた",
  ];

  double _appBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  final double _bottomAppBarHeight = 70;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            color: Theme.of(context).cardColor,
            child: NestedScrollView(
              pinnedHeaderSliverHeightBuilder: () {
                return _appBarHeight(context) + _bottomAppBarHeight;
              },
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
                        final pokemon =
                            useProvider(currentPokemonProvider).state;
                        if (pokemon == null)
                          return SliverAppBar(); //空のSliverAppBar
                        return SliverPadding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          sliver: SliverPersistentHeader(
                            delegate: PokemonHeaderSliverDelegate(
                              pokemon: pokemon,
                              tabBar: TabBar(
                                tabs: _tabs
                                    .map((String name) => Tab(text: name))
                                    .toList(),
                                indicatorColor: pokemon.color,
                                indicatorWeight: 4,
                              ),
                              appBarHeight: _appBarHeight(context),
                              bottomAppBarHeight: _bottomAppBarHeight,
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
                return Key('tab_${DefaultTabController.of(context)!.index}');
              },
              body: TabBarView(
                children: [
                  TabViewItem(
                    tabKey: Key('tab_0'),
                    body: Column(
                      children: <Widget>[
                        HookBuilder(builder: (context) {
                          final pokemon =
                              useProvider(currentPokemonProvider).state;
                          if (pokemon == null) return Container();
                          return PokemonStatsChart(pokemon: pokemon);
                        }),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  TabViewItem(
                    tabKey: Key('tab_1'),
                    body: Container(),
                  ),
                  TabViewItem(
                    tabKey: Key('tab_2'),
                    body: Container(),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // context
              //     .read(pokemonViewModelProvider)
              //     .setName('dragapult'); //context.read使わんでもいいかも
              // context.read(currentPokemonProvider).fetchPokemon(887);
              // print(DefaultTabController.of(context)?.index);
            },
          ),
        );
      }),
    );
  }
}
