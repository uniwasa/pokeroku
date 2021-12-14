import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
import 'package:pokeroku/util/stat_text_input_formatter.dart';
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
                        final result = await ref
                            .read(buildEditViewModelProviderFamily(
                                    _buildEditParam)
                                .notifier)
                            .saveBuild();
                        if (result) {
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('努力値合計は510以下にしてください'),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                    },
                    icon: Icon(Icons.save)),
              ),
            ],
          ),
          body: SingleChildScrollView(
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
                      makeLevelListTile(ref: ref, level: build.level),
                      for (final statName in StatSet.keys)
                        HookBuilder(builder: (context) {
                          final natureList =
                              ref.watch(natureListProvider).value;
                          if (natureList == null) return ListTile();
                          return makeStatListTile(
                            ref: ref,
                            statName: statName,
                            pokemon: pokemon,
                            build: build,
                            natureList: natureList,
                          );
                        }),
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

  Widget makeStatTextFormField({
    required String initialValue,
    required String labelText,
    required TextInputFormatter textInputFormatter,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
    required void Function(String?) onSaved,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: SizedBox(
        height: 32.0,
        width: 42.0,
        child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          ),
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            textInputFormatter,
          ],
          keyboardType: TextInputType.numberWithOptions(
            signed: true,
            decimal: true,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  Widget makeStatListTile({
    required WidgetRef ref,
    required String statName,
    required Pokemon pokemon,
    required Build build,
    required List<Nature> natureList,
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
            effortValue: effortValue)
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
          makeStatTextFormField(
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
            textInputFormatter: StatTextInputFormatter(min: 0, max: 31),
          ),
          makeStatTextFormField(
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
              if (!isValidEffortValue(value)) return '有効な値を入力してください';
            },
            textInputFormatter: StatTextInputFormatter(min: 0, max: 252),
          )
        ],
      ),
    );
  }

  Widget makeLevelListTile({required WidgetRef ref, required int? level}) {
    return ListTile(
      leading: Text('ステータス'),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          makeStatTextFormField(
            initialValue: (level ?? 50).toString(),
            labelText: 'Level',
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
              if (!isValidLevel(value)) return '有効な値を入力してください';
            },
            textInputFormatter: StatTextInputFormatter(min: 1, max: 100),
          ),
        ],
      ),
    );
  }
}
