import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/stat_set.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/provider/item_list_provider.dart';
import 'package:pokeroku/provider/nature_list_provider.dart';
import 'package:pokeroku/provider/pokemon_ability_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/util/stat_text_input_formatter.dart';

class BuildEditPage extends HookWidget with ValidationMixin {
  BuildEditPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
    final allPokemon = useProvider(allPokemonsProvider).data?.value;
    final pokemonId = useProvider(
        buildEditViewModelProviderFamily(_buildEditParam)
            .select((value) => value.data?.value.pokemonId));

    if (allPokemon == null || pokemonId == null) return Scaffold();

    final pokemon = allPokemon.firstWhere((element) => element.id == pokemonId);
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
                    if (formGlobalKey.currentState?.validate() == true) {
                      final result = await context
                          .read(
                              buildEditViewModelProviderFamily(_buildEditParam)
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
                final abilityList = useProvider(
                        pokemonAbilityListProvider(_buildEditParam.pokemonId))
                    .data
                    ?.value;
                final abilityId = useProvider(
                    buildEditViewModelProviderFamily(_buildEditParam)
                        .select((value) => value.data?.value.abilityId));
                return ListTile(
                  leading: Text('特性'),
                  title: Text(abilityList == null || abilityId == null
                      ? '未選択'
                      : abilityList
                          .firstWhere((element) => element.id == abilityId)
                          .nameJp),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.abilitySelection,
                        arguments: _buildEditParam);
                  },
                );
              }),
              HookBuilder(builder: (context) {
                final natureList = useProvider(natureListProvider).data?.value;
                final natureId = useProvider(
                    buildEditViewModelProviderFamily(_buildEditParam)
                        .select((value) => value.data?.value.natureId));
                return ListTile(
                  leading: Text('性格'),
                  title: Text(natureList == null || natureId == null
                      ? '未選択'
                      : natureList
                          .firstWhere((element) => element.id == natureId)
                          .nameJp),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.natureSelection,
                        arguments: _buildEditParam);
                  },
                );
              }),
              HookBuilder(builder: (context) {
                final itemList = useProvider(itemListProvider).data?.value;
                final itemId = useProvider(
                    buildEditViewModelProviderFamily(_buildEditParam)
                        .select((value) => value.data?.value.itemId));

                return ListTile(
                  leading: Text('持ち物'),
                  title: Text(itemList == null || itemId == null
                      ? '未選択'
                      : itemList
                          .firstWhere((element) => element.id == itemId)
                          .nameJp),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.itemSelection,
                        arguments: _buildEditParam);
                  },
                );
              }),
              Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    for (final statName in StatSet.keys)
                      makeStatListTile(context: context, statName: statName),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget makeStatTextFormField({
    required String initialValue,
    required String labelText,
    required TextInputFormatter textInputFormatter,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
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

  Widget makeStatListTile(
      {required BuildContext context, required String statName}) {
    final effortValues = context
        .read(buildEditViewModelProviderFamily(_buildEditParam))
        .data
        ?.value
        .effortValues
        ?.toJson();
    return ListTile(
      leading: Text(StatSet.abbr[statName] ?? statName),
      title: Row(
        children: [
          Expanded(
            child: HookBuilder(
              builder: (context) {
                final effortValues = useProvider(
                  buildEditViewModelProviderFamily(_buildEditParam).select(
                    (value) => value.data?.value.effortValues?.toJson(),
                  ),
                );
                return Text((effortValues?[statName] ?? 0).toString());
              },
            ),
          ),
          makeStatTextFormField(
            initialValue: (effortValues?[statName] ?? 0).toString(),
            labelText: 'EV',
            onChanged: (value) {
              if (isValidEffortValue(value))
                context
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
}
