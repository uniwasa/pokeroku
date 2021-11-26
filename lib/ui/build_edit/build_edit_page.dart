import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';
import 'package:pokeroku/model/stat.dart';
import 'package:pokeroku/provider/all_pokemons_provider.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/util/stat_text_input_formatter.dart';

class BuildEditPage extends HookWidget with ValidationMixin {
  BuildEditPage({Key? key, required BuildEditParameter buildEditParameter})
      : _buildEditParameter = buildEditParameter,
        super(key: key);

  final BuildEditParameter _buildEditParameter;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context
        .read(buildEditViewModelProviderFamily(_buildEditParameter).notifier);
    final formGlobalKey = GlobalKey<FormState>();
    final allPokemon = useProvider(allPokemonsProvider).data?.value;
    final pokemonId = useProvider(
        buildEditViewModelProviderFamily(_buildEditParameter)
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
                      if (!await provider.saveBuild()) {
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
        body: Builder(builder: (context) {
          final effortValues = context
              .read(buildEditViewModelProviderFamily(_buildEditParameter))
              .data
              ?.value
              .effortValues
              ?.toJson();
          return Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      for (final statName in Stat.keys())
                        Flexible(
                          child: makeStatTextFormField(
                            initialValue:
                                (effortValues?[statName] ?? 0).toString(),
                            labelText: statName,
                            onChanged: (value) {
                              if (isValidEffortValue(value))
                                provider.updateEffortValues(
                                    statName: statName,
                                    effortValue: int.parse(value));
                            },
                            validator: (value) {
                              if (!isValidEffortValue(value))
                                return '有効な値を入力してください';
                            },
                            textInputFormatter:
                                StatTextInputFormatter(min: 0, max: 252),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
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
        height: 40.0,
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
}
