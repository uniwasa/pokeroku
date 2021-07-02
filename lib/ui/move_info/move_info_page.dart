import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/move_info_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/move_info/move_info_view_model.dart';
import 'package:pokeroku/util.dart';

class MoveInfoPage extends StatelessWidget {
  MoveInfoPage({Key? key, required Move move}) : super(key: key) {
    _provider =
        StateNotifierProvider.autoDispose<MoveInfoViewModel, MoveInfoState>(
            (ref) {
      return MoveInfoViewModel(
        dataSource: ref.read(pokedexDataSourceProvider),
        move: move,
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<MoveInfoViewModel, MoveInfoState>
      _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HookBuilder(builder: (context) {
        final move = useProvider(_provider.select((value) => value.move));
        final asyncPokemons =
            useProvider(_provider.select((value) => value.asyncPokemons));

        //ポケモンのリスト部分
        final pokemonGroupSlivers = asyncPokemons.when(
          data: (pokemons) {
            final pokemonsLevel = pokemons
                .where((pokemon) => pokemon.pokemonMoveMethodId == 1)
                .toList();
            final pokemonsEgg = pokemons
                .where((pokemon) => pokemon.pokemonMoveMethodId == 2)
                .toList();
            final pokemonsTutor = pokemons
                .where((pokemon) => pokemon.pokemonMoveMethodId == 3)
                .toList();
            final pokemonsMachine = pokemons
                .where((pokemon) => pokemon.pokemonMoveMethodId == 4)
                .toList();

            final pokemonGroup = {
              'レベル': pokemonsLevel,
              'マシン': pokemonsMachine,
              'タマゴ': pokemonsEgg,
              '教え技': pokemonsTutor,
            };

            return pokemonGroup.entries.map((e) {
              final key = e.key;
              final pokemons = e.value;
              return SliverStickyHeader(
                  header: Container(
                    height: 30.0,
                    color: Theme.of(context).backgroundColor,
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
                        final pokemon = pokemons[index];
                        final Image pokemonImage = Image.asset(
                          pokemon.imageName,
                          isAntiAlias: true,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.none,
                        );
                        final pokemonHeroImage = Hero(
                          tag: pokemon.identifier,
                          child: pokemonImage,
                        );
                        String trailingText =
                            pokemon.pokemonMoveVersionGroupId != 20
                                ? '剣盾以前'
                                : '';
                        return ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pokemon.nameJp,
                                style: TextStyle(fontSize: 16),
                              ),
                              if (pokemon.formNameJp != null)
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    pokemon.formNameJp!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: pokemonHeroImage,
                          ),
                          trailing: Text(trailingText,
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 10)),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.pokeinfo,
                                arguments: pokemon);
                          },
                        );
                      },
                      childCount: pokemons.length,
                    ),
                  ));
            }).toList();
          },
          loading: () => [
            SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          ],
          error: (error, _) => [
            SliverFillRemaining(
              child: Center(child: Text(error.toString())),
            )
          ],
        );

        //本体
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(move.nameJp),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        buildDataItem(
                          label: 'タイプ',
                          widget: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: buildBadge(
                                text: move.type.nameJp, color: move.type.color),
                          ),
                        ),
                        buildDataItem(
                          label: '分類',
                          widget: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: buildBadge(
                                text: move.damageClassNameJp,
                                color: move.damageClassColor,
                                isSquare: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        buildDataTextItem(
                            label: '威力', text: (move.power ?? '-').toString()),
                        buildDataTextItem(
                            label: '命中率',
                            text: (move.accuracy ?? '-').toString()),
                        buildDataTextItem(
                            label: 'PP', text: move.pp.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        move.flavorTextJp.replaceAll(RegExp(r'\n'), ''),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            for (Widget sliver in pokemonGroupSlivers) sliver
          ],
        );
      }),
    );
  }

  Widget buildDataItem({required String label, required Widget widget}) {
    final context = useContext();
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 12,
              ),
            ),
            widget
          ],
        ),
      ),
    );
  }

  Widget buildDataTextItem({required String label, required String text}) {
    return buildDataItem(
      label: label,
      widget: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
