import 'dart:io';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokeinfo_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/pokeinfo/component/pokemon_header_sliver_delegate.dart';
import 'package:pokeroku/ui/pokeinfo/component/pokemon_stats_chart.dart';
import 'package:pokeroku/ui/pokeinfo/component/tab_view_item.dart';
import 'package:pokeroku/ui/pokeinfo/pokeinfo_view_model.dart';

part './component/tab_content_base.dart';
part './component/tab_content_evolution.dart';
part './component/tab_content_move.dart';

class PokeinfoPage extends StatelessWidget {
  PokeinfoPage({Key? key, required Pokemon pokemon}) : super(key: key) {
    _provider =
        StateNotifierProvider.autoDispose<PokeinfoViewModel, PokeinfoState>(
            (ref) {
      return PokeinfoViewModel(
        dataSource: ref.read(pokedexDataSourceProvider),
        allPokemons: ref.watch(allPokemonsProvider),
        pokemon: pokemon,
      );
    });
  }

  late final AutoDisposeStateNotifierProvider<PokeinfoViewModel, PokeinfoState>
      _provider;

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
                        final pokemon = useProvider(
                            _provider.select((value) => value.pokemonBase));
                        return SliverPadding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          sliver: SliverPersistentHeader(
                            delegate: PokemonHeaderSliverDelegate(
                              pokemon: pokemon,
                              tabBar: TabBar(
                                tabs: _tabs
                                    .map((String name) => Tab(text: name))
                                    .toList(),
                                indicatorColor: pokemon.firstType.color,
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
                final asyncPokemonEx = useProvider(
                    _provider.select((value) => value.asyncPokemonEx));
                return asyncPokemonEx.when(
                  data: (pokemonEx) {
                    return TabBarView(
                      children: [
                        TabViewItem(
                          tabKey: Key('tab_0'),
                          slivers: buildTabContentBase(
                              context: context, pokemonEx: pokemonEx),
                        ),
                        TabViewItem(
                          tabKey: Key('tab_1'),
                          slivers: buildTabContentBase(
                              context: context, pokemonEx: pokemonEx),
                        ),
                        HookBuilder(
                          builder: (context) {
                            final asyncMoves = useProvider(
                                _provider.select((value) => value.asyncMoves));
                            return TabViewItem(
                              tabKey: Key('tab_2'),
                              slivers: buildTabContentMove(
                                  context: context, asyncMoves: asyncMoves),
                            );
                          },
                        ),
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
              // Navigator.popUntil(context, (route) => route.isFirst);
              final allPokemons = context.read(allPokemonsProvider);
              allPokemons.whenData((data) =>
                  context.read(_provider.notifier).setPokemon(data.first));

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
