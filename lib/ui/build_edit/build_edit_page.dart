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

    return Scaffold(
        appBar: AppBar(
          title: Text('ポケモン編集'),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              HookBuilder(builder: (context) {
                final build = useProvider(
                    buildEditViewModelProviderFamily(param)
                        .select((value) => value.pokemonId));
                return Text(build.toString());
              }),
              Builder(builder: (context) {
                final effortValues = context
                        .read(buildEditViewModelProviderFamily(param))
                        .effortValues ??
                    {};
                return Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      for (final statName in StatName.list)
                        makeStatTextFormField(
                          initialValue:
                              (effortValues[statName] ?? 0).toString(),
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
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              print('ok');
                              formGlobalKey.currentState!.save();
                            }
                          },
                          child: Text('保存'))
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
    required TextInputFormatter textInputFormatter,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: labelText),
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
    );
  }
}
