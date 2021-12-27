import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/move_selection_param.dart';
import 'package:pokeroku/model/nature.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/stat_set.dart';
import 'package:pokeroku/provider/move_list_provider.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/provider/item_list_provider.dart';
import 'package:pokeroku/provider/nature_list_provider.dart';
import 'package:pokeroku/provider/ability_list_by_pokemon_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';
import 'package:dartx/dartx.dart';

class BuildEditPage extends HookConsumerWidget with ValidationMixin {
  BuildEditPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;
  final GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pokemonListProvider).value;
    final asyncBuild =
        ref.watch(buildEditViewModelProviderFamily(_buildEditParam));

    final focusNodeLV = useFocusNode();
    final Map<String, FocusNode> focusNodesIV = Map.fromIterables(
        StatSet.keys.map((e) => e), StatSet.keys.map((e) => useFocusNode()));
    final Map<String, FocusNode> focusNodesEV = Map.fromIterables(
        StatSet.keys.map((e) => e), StatSet.keys.map((e) => useFocusNode()));

    final actions = [KeyboardActionsItem(focusNode: focusNodeLV)];
    for (final statName in StatSet.keys) {
      actions.add(KeyboardActionsItem(focusNode: focusNodesIV[statName]!));
      actions.add(KeyboardActionsItem(focusNode: focusNodesEV[statName]!));
    }

    return asyncBuild.when(
      data: (build) {
        final pokemonId = build.pokemonId;
        final pokemon =
            pokemonList?.firstOrNullWhere((element) => element.id == pokemonId);
        if (pokemon == null)
          return Scaffold(
              appBar: AppBar(), body: Center(child: Text('存在しないポケモンです')));

        return Scaffold(
          appBar: AppBar(
            title: HookBuilder(builder: (context) {
              return Text(pokemon.fullNameJp);
            }),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close)),
            actions: [
              Container(
                width: kToolbarHeight,
                child: IconButton(
                    onPressed: () async {
                      if (_formGlobalKey.currentState?.validate() == true) {
                        _formGlobalKey.currentState?.save();
                        _saveBuild(context: context, ref: ref);
                      }
                    },
                    icon: Icon(Icons.save)),
              ),
            ],
          ),
          body: KeyboardActions(
            config: KeyboardActionsConfig(
              keyboardBarColor: Colors.black,
              defaultDoneWidget: Icon(Icons.close),
              actions: actions,
            ),
            child: Column(
              children: [
                HookBuilder(builder: (context) {
                  final ability = ref
                      .watch(abilityListByPokemonProvider(
                          _buildEditParam.pokemonId))
                      .value
                      ?.firstOrNullWhere(
                          (element) => element.id == build.abilityId);
                  return ListTile(
                    leading: Text('特性'),
                    title: Text(ability == null ? '未選択' : ability.nameJp),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.abilitySelection,
                          arguments: _buildEditParam);
                    },
                  );
                }),
                HookBuilder(builder: (context) {
                  final nature = ref
                      .watch(natureListProvider)
                      .value
                      ?.firstOrNullWhere(
                          (element) => element.id == build.natureId);
                  return ListTile(
                    leading: Text('性格'),
                    title: Text(nature == null ? '未選択' : nature.nameJp),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.natureSelection,
                          arguments: _buildEditParam);
                    },
                  );
                }),
                HookBuilder(builder: (context) {
                  final item = ref
                      .watch(itemListProvider)
                      .value
                      ?.firstOrNullWhere(
                          (element) => element.id == build.itemId);
                  return ListTile(
                    leading: Text('持ち物'),
                    title: Text(item == null ? '未選択' : item.nameJp),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.itemSelection,
                          arguments: _buildEditParam);
                    },
                  );
                }),
                Form(
                  key: _formGlobalKey,
                  child: Column(
                    children: [
                      _makeLevelListTile(
                          ref: ref, level: build.level, focusNode: focusNodeLV),
                      for (final statName in StatSet.keys)
                        HookBuilder(
                          builder: (context) {
                            final natureList =
                                ref.watch(natureListProvider).value;
                            if (natureList == null) return ListTile();
                            return _makeStatListTile(
                              ref: ref,
                              statName: statName,
                              pokemon: pokemon,
                              build: build,
                              natureList: natureList,
                              focusNodesIV: focusNodesIV,
                              focusNodesEV: focusNodesEV,
                            );
                          },
                        ),
                    ],
                  ),
                ),
                for (var i = 0; i < 4; i++)
                  HookBuilder(builder: (context) {
                    final move = ref
                        .watch(moveListProvider)
                        .value
                        ?.firstOrNullWhere((element) =>
                            element.id == build.moves?.elementAtOrNull(i));
                    return ListTile(
                      leading: Text('技' + (i + 1).toString()),
                      title: Text(move == null ? '未選択' : move.nameJp),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.moveSelection,
                            arguments: MoveSelectionParam(
                                moveIndex: i, buildEditParam: _buildEditParam));
                      },
                    );
                  }),
              ],
            ),
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(error.toString())),
      ),
    );
  }

  Widget _makeStatTextFormField({
    required String initialValue,
    required String labelText,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
    required void Function(String?) onSaved,
    required FocusNode focusNode,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 32.0,
        width: 42.0,
        child: TextFormField(
          initialValue: initialValue,
          focusNode: focusNode,
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0, fontSize: 0),
            labelText: labelText,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white24)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          ),
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  Widget _makeStatListTile({
    required WidgetRef ref,
    required String statName,
    required Pokemon pokemon,
    required Build build,
    required List<Nature> natureList,
    required Map<String, FocusNode> focusNodesIV,
    required Map<String, FocusNode> focusNodesEV,
  }) {
    final natureId = build.natureId ?? 1; // nullならがんばりや
    final nature = natureList.firstWhere((element) => element.id == natureId);
    final int natureRate = nature.rate.toJson()[statName];
    final int baseValue = pokemon.stats.toJson()[statName];
    final int level = build.level ?? 50;
    final int individualValue =
        build.individualValues?.toJson()[statName] ?? 31;
    final int effortValue = build.effortValues?.toJson()[statName] ?? 0;
    final actualValue = statName == 'hp'
        ? StatSet.actualHP(
            baseValue: baseValue,
            level: level,
            individualValue: individualValue,
            effortValue: effortValue,
            pokemonId: pokemon.id)
        : StatSet.actualValue(
            baseValue: baseValue,
            level: level,
            individualValue: individualValue,
            effortValue: effortValue,
            natureRate: natureRate);

    return ListTile(
      leading: Text(StatSet.abbr[statName] ?? statName),
      title: Row(
        children: [
          Expanded(
            child: Text((actualValue).toString()),
          ),
          _makeStatTextFormField(
            initialValue: (individualValue).toString(),
            labelText: 'IV',
            onChanged: (value) {
              if (isValidIndividualValue(value))
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateIndividualValues(
                        statName: statName, individualValue: int.parse(value));
            },
            onSaved: (value) {
              if (value != null)
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateIndividualValues(
                        statName: statName, individualValue: int.parse(value));
            },
            validator: (value) {
              if (!isValidIndividualValue(value)) return '有効な値を入力してください';
            },
            focusNode: focusNodesIV[statName]!,
          ),
          _makeStatTextFormField(
            initialValue: (effortValue).toString(),
            labelText: 'EV',
            onChanged: (value) {
              if (isValidEffortValue(value))
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateEffortValues(
                        statName: statName, effortValue: int.parse(value));
            },
            onSaved: (value) {
              if (value != null)
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateEffortValues(
                        statName: statName, effortValue: int.parse(value));
            },
            validator: (value) {
              if (!isValidEffortValue(value)) return '無効';
            },
            focusNode: focusNodesEV[statName]!,
          )
        ],
      ),
    );
  }

  Widget _makeLevelListTile({
    required WidgetRef ref,
    required int? level,
    required FocusNode focusNode,
  }) {
    return ListTile(
      leading: Text('ステータス'),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _makeStatTextFormField(
            initialValue: (level ?? 50).toString(),
            labelText: 'LV',
            onChanged: (value) {
              if (isValidLevel(value))
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateLevel(level: int.parse(value));
            },
            onSaved: (value) {
              if (value != null)
                ref
                    .read(buildEditViewModelProviderFamily(_buildEditParam)
                        .notifier)
                    .updateLevel(level: int.parse(value));
            },
            validator: (value) {
              if (!isValidLevel(value)) return '無効';
            },
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }

  Future<void> _saveBuild(
      {required BuildContext context, required WidgetRef ref}) async {
    final build =
        ref.read(buildEditViewModelProviderFamily(_buildEditParam)).value;
    if (build != null) {
      final effortValues = build.effortValues;
      if (effortValues == null || effortValues.isValidEffortValues()) {
        final teamId = _buildEditParam.teamId;
        if (teamId != null) {
          // パーティ画面用
          final result = await ref
              .read(teamEditViewModelProviderFamily(teamId).notifier)
              .updateBuild(build: build);
          if (result) Navigator.pop(context);
        } else {
          // ポケモン単体画面用
          // TODO: ポケモン単体画面用
        }
      } else {
        // 無効な努力値の場合
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('努力値合計は510以下にしてください'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
