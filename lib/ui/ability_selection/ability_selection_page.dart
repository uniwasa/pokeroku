import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/provider/pokemon_ability_list_provider.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';

class AbilitySelectionPage extends StatelessWidget {
  AbilitySelectionPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue =
          useProvider(pokemonAbilityListProvider(_buildEditParam.pokemonId));

      return Scaffold(
        appBar: AppBar(
          title: Text('特性選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (abilityList) {
                return ListView.builder(
                  itemCount: abilityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ability = abilityList[index];

                    return ListTile(
                      title: Text(ability.nameJp),
                      trailing: Text(
                        ability.isHidden ? '夢特性' : '',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      onTap: () {
                        final teamId = _buildEditParam.teamId;
                        if (teamId != null) {
                          // パーティ画面用
                          context
                              .read(buildEditViewModelProviderFamily(
                                      _buildEditParam)
                                  .notifier)
                              .updateAbility(abilityId: ability.id);
                        } else {
                          // ポケモン単体画面用
                          // TODO: ポケモン単体画面用
                        }
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) => Center(
                child: Text(error.toString()),
              ),
            );
          },
        ),
      );
    });
  }
}
