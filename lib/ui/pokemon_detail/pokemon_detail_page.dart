import 'dart:io';

import 'package:collection/collection.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart' hide NestedScrollView;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon_detail_state.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/provider/ability_list_by_pokemon_provider.dart';
import 'package:pokeroku/provider/evolution_line_provider.dart';
import 'package:pokeroku/provider/pokemon_flavor_text_list_provider.dart';
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
    _provider = StateNotifierProvider.autoDispose<PokemonDetailViewModel,
        PokemonDetailState>((ref) {
      return PokemonDetailViewModel(
        read: ref.read,
        pokemon: pokemon,
        asyncMoveList: ref.watch(moveListByPokemonProvider(pokemon.id)),
        asyncPokemonFlavorTextList:
            ref.watch(pokemonFlavorTextProvider(pokemon.id)),
        asyncAbilityList: ref.watch(abilityListByPokemonProvider(pokemon.id)),
        asyncEvolutionLine: ref.watch(evolutionLineProvider(pokemon.id)),
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
                            _provider.select((value) => value.pokemon));
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
                final pokemonDetailState = useProvider(_provider);
                return TabBarView(
                  children: [
                    TabViewItem(
                      tabKey: Key('tab_0'),
                      slivers: buildTabContentBase(
                          context: context,
                          pokemonDetailState: pokemonDetailState),
                    ),
                    TabViewItem(
                      tabKey: Key('tab_1'),
                      slivers: buildTabContentStats(
                        context: context,
                        pokemonDetailState: pokemonDetailState,
                      ),
                    ),
                    HookBuilder(
                      builder: (context) {
                        final asyncMoveList = useProvider(
                            _provider.select((value) => value.asyncMoveList));
                        return TabViewItem(
                          tabKey: Key('tab_2'),
                          slivers: buildTabContentMove(
                              context: context, asyncMoveList: asyncMoveList),
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}
