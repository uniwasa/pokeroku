import 'dart:io';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/current_pokemon_provider.dart';
import 'package:pokeroku/ui/component/pokemon_header_sliver_delegate.dart';
import 'package:pokeroku/ui/component/pokemon_stats_chart.dart';
import 'package:pokeroku/ui/component/tab_view_item.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_view_model.dart';

class PokeinfoPage extends StatelessWidget {
  final List<String> _tabs = <String>[
    "きほん",
    "しんか",
    "わざ",
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
                            useProvider(currentPokemonProvider.state);
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
                                indicatorColor: pokemon.firstTypeColor,
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
              body: HookBuilder(builder: (context) {
                final pokemonExState =
                    useProvider(pokeinfoViewModelProvider.state);
                final currentPokemon =
                    useProvider(currentPokemonProvider.state);

                return pokemonExState.when(
                  data: (pokemonEx) {
                    return TabBarView(
                      children: [
                        TabViewItem(
                          tabKey: Key('tab_0'),
                          body: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12,
                                        top: 4,
                                        right: 12,
                                        bottom: 12),
                                    child: Center(
                                      child: Text(
                                        pokemonEx.flavorTextJp
                                            .replaceAll(RegExp(r'\n'), ''),
                                        style: TextStyle(
                                            height: 2,
                                            letterSpacing: 1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (currentPokemon != null)
                                PokemonStatsChart(pokemon: currentPokemon),
                            ],
                          ),
                        ),
                        TabViewItem(
                          tabKey: Key('tab_1'),
                          body: buildEvolutions(
                              context: context, pokemonEx: pokemonEx),
                        ),
                        TabViewItem(
                          tabKey: Key('tab_2'),
                          body: Container(),
                        )
                      ],
                    );
                  },
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => Center(
                    child: Text(error.toString()),
                  ),
                );
              }),
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

  Widget buildEvolutions(
      {required BuildContext context, required PokemonEx pokemonEx}) {
    List<Widget> evolutionsWidget = [];
    for (final stage in pokemonEx.evolutions) {
      final stageWidget = Expanded(
          flex: stage.length < 5 ? 3 : 10,
          child: Container(
            child: Center(
              child: Wrap(
                children: stage.map((stagePokemon) {
                  final Image pokemonImage = Image.asset(
                    stagePokemon.imageName,
                    isAntiAlias: true,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.none,
                    width: stage.length < 5 ? double.infinity : null,
                  );
                  return InkWell(
                    onTap: () {
                      context
                          .read(currentPokemonProvider)
                          .setPokemon(stagePokemon);
                    },
                    child: Padding(
                      child: pokemonImage,
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  );
                }).toList(),
                alignment: WrapAlignment.start,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ));
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: evolutionsWidget,
    );
  }
}
