import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/provider/move_list_provider.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';

class MoveSelectionPage extends StatelessWidget {
  MoveSelectionPage({Key? key, required BuildEditParam buildEditParam})
      : _buildEditParam = buildEditParam,
        super(key: key);

  final BuildEditParam _buildEditParam;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue = useProvider(moveListProvider);

      return Scaffold(
        appBar: AppBar(
          title: Text('技選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (moveList) {
                return ListView.builder(
                  itemCount: moveList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final move = moveList[index];

                    return ListTile(
                      leading: Text(move.type!.nameJp),
                      title: Text(move.nameJp),
                      onTap: () {
                        final teamId = _buildEditParam.teamId;
                        if (teamId != null) {
                          // パーティ画面用
                          // TODO: パーティ画面用
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
