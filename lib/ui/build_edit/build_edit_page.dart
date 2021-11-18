import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/const/stat_name.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/util/stat_text_input_formatter.dart';

class BuildEditPage extends StatelessWidget with ValidationMixin {
  BuildEditPage({Key? key, required BuildEditParameter buildEditParameter})
      : _build = buildEditParameter.build,
        _buildManager = buildEditParameter.buildManager,
        super(key: key);

  final Build _build;
  final BuildManager _buildManager;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final param =
        BuildEditParameter(build: _build, buildManager: _buildManager);
    final provider =
        context.read(buildEditViewModelProviderFamily(param).notifier);
    final formGlobalKey = GlobalKey<FormState>();
    Map<String, int> effortValues;

    return Scaffold(
        appBar: AppBar(
          title: Text('ポケモン編集'),
          automaticallyImplyLeading: false,
          actions: [
            Container(
              width: kToolbarHeight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.save)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              HookBuilder(builder: (context) {
                final build =
                    useProvider(buildEditViewModelProviderFamily(param));
                return Text(build.pokemonId.toString());
              }),
              Builder(builder: (context) {
                return Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      for (final statName in StatName.list)
                        makeStatTextFormField(
                          initialValue: (provider.effortValues?[statName] ?? 0)
                              .toString(),
                          labelText: statName,
                          validator: (value) {
                            final oldEffortValues = {
                              ...provider.effortValues ?? {}
                            };
                            final newEffortValues = makeValidEffortValues(
                                value: value ?? 0.toString(),
                                statName: statName,
                                effortValues: oldEffortValues);
                            if (newEffortValues != null) {
                              provider.effortValues = newEffortValues;
                              return null;
                            } else {
                              return '';
                            }
                          },
                          textInputFormatter:
                              StatTextInputFormatter(min: 0, max: 252),
                        ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              print('ok');
                              formGlobalKey.currentState!.save();
                            }
                          },
                          child: Text("Submit"))
                    ],
                  ),
                );
              }),
            ],
          ),
        ));
  }

  Widget makeStatTextFormField({
    required String initialValue,
    required String labelText,
    required String? Function(String?) validator,
    required TextInputFormatter textInputFormatter,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        textInputFormatter,
      ],
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Map<String, int>? makeValidEffortValues(
      {required String value,
      required String statName,
      required Map<String, int> effortValues}) {
    if (isNumeric(value)) {
      final num = int.parse(value);
      effortValues[statName] = num;
      if (0 <= num && num <= 252 && effortValues.values.toList().sum <= 510)
        return effortValues;
    }
  }
}
