import 'dart:io';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/pokemon_ex.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/provider/move_list_by_pokemon_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/pokemon_detail/component/pokemon_evolution_chain.dart';
import 'package:pokeroku/ui/pokemon_detail/component/pokemon_header_sliver_delegate.dart';
import 'package:pokeroku/ui/pokemon_detail/component/pokemon_stats_chart.dart';
import 'package:pokeroku/ui/pokemon_detail/component/tab_view_item.dart';
import 'package:pokeroku/ui/pokemon_detail/pokemon_detail_view_model.dart';
import 'package:pokeroku/util.dart';

part './component/tab_content_base.dart';
part './component/tab_content_stats.dart';
part './component/tab_content_move.dart';

class PokemonDetailPage extends StatelessWidget {
  PokemonDetailPage({Key? key, required Pokemon pokemon}) : super(key: key) {
    _provider =
        StateNotifierProvider.autoDispose<PokemonDetailViewModel, PokemonDetailState>(
            (ref) {
      return PokemonDetailViewModel(
        read: ref.read,
        pokemonList: ref.watch(pokemonListProvider),
        moveList: ref.watch(moveListByPokemonProvider(pokemon.id)),
        pokemon: pokemon,
      );
    });
  }

  late final AutoDisposeStateNotifierProvider<PokemonDetailViewModel,
      PokemonDetailState> _provider;

  final List<String> _tabs = <String>[
    "きほん",
    "のうりょく",
    "わざ",
  ];

  double _appBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  final double _bottomAppBarHeight = kToolbarHeight;

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
                                indicatorColor:
                                    pokemon.firstType?.color ?? Colors.grey,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorPadding: EdgeInsets.only(bottom: 8),
                                indicatorWeight: 3,
                                labelPadding: EdgeInsets.only(top: 8),
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
                          slivers: buildTabContentStats(
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
              // final pokemonList = context.read(pokemonListProvider);
              // pokemonList.whenData((data) =>
              //     context.read(_provider.notifier).setPokemon(data.first));
              // print(DefaultTabController.of(context)?.index);
            },
          ),
        );
      }),
    );
  }
}
