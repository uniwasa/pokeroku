import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/ability_info_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/ui/ability_info/ability_info_view_model.dart';

class AbilityInfoPage extends StatelessWidget {
  AbilityInfoPage({Key? key, required Ability ability}) : super(key: key) {
    _provider = StateNotifierProvider.autoDispose<AbilityInfoViewModel,
        AbilityInfoState>((ref) {
      return AbilityInfoViewModel(
        dataSource: ref.read(pokedexDataSourceProvider),
        ability: ability,
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<AbilityInfoViewModel,
      AbilityInfoState> _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HookBuilder(builder: (context) {
        final ability = useProvider(_provider.select((value) => value.ability));
        final asyncPokemons =
            useProvider(_provider.select((value) => value.asyncPokemons));
        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(ability.nameJp),
              pinned: true,
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
                        ability.flavorTextJp.replaceAll(RegExp(r'\n'), ''),
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  print(index);
                  return ListTile(
                    title: Text('hello'),
                  );
                },
                childCount: 100,
              ),
            ),
          ],
        );
      }),
    );
  }
}
