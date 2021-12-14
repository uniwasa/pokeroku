import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/ui/item_selection/item_selection_view_model.dart';

class ItemSelectionPage extends StatelessWidget {
  ItemSelectionPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final asyncValue =
          ref.watch(itemSelectionViewModelProviderFamily(_buildEditParam));

      return Scaffold(
        appBar: AppBar(
          title: Text('アイテム選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (itemList) {
                return ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = itemList[index];

                    return ListTile(
                      title: Text(item.nameJp),
                      onTap: () {
                        final teamId = _buildEditParam.teamId;
                        if (teamId != null) {
                          // パーティ画面用
                          ref
                              .read(buildEditViewModelProviderFamily(
                                      _buildEditParam)
                                  .notifier)
                              .updateItem(itemId: item.id);
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
