import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/provider/nature_list_provider.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';

class NatureSelectionPage extends StatelessWidget {
  NatureSelectionPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue = useProvider(natureListProvider);

      return Scaffold(
        appBar: AppBar(
          title: Text('性格選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (natureList) {
                return ListView.builder(
                  itemCount: natureList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final nature = natureList[index];

                    return ListTile(
                      title: Text(nature.nameJp),
                      onTap: () {
                        final teamId = _buildEditParam.teamId;
                        if (teamId != null) {
                          // パーティ画面用
                          print(nature.rate);
                          context
                              .read(buildEditViewModelProviderFamily(
                                      _buildEditParam)
                                  .notifier)
                              .updateNature(natureId: nature.id);
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
