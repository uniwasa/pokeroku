import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/move_selection_param.dart';
import 'package:pokeroku/provider/move_list_provider.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';
import 'package:pokeroku/ui/component/serch_field.dart';
import 'package:pokeroku/ui/move_selection/move_selection_view_model.dart';
import 'package:pokeroku/util.dart';

class MoveSelectionPage extends StatelessWidget {
  MoveSelectionPage({Key? key, required MoveSelectionParam moveSelectionParam})
      : _moveIndex = moveSelectionParam.moveIndex,
        _buildEditParam = moveSelectionParam.buildEditParam,
        super(key: key);

  final int _moveIndex;
  final BuildEditParam _buildEditParam;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final asyncValue =
          ref.watch(moveSelectionViewModelProviderFamily(_buildEditParam));

      return Scaffold(
        appBar: AppBar(
          title: Text('技選択'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return asyncValue.when(
              data: (moveList) {
                return Column(
                  children: [
                    SearchField(
                      callback: (final text) {
                        final provider = ref.read(
                            moveSelectionViewModelProviderFamily(
                                    _buildEditParam)
                                .notifier);
                        provider.searchForText(text);
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: moveList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final move = moveList[index];

                          return ListTile(
                            leading: move.type == null
                                ? Container()
                                : buildBadge(
                                    text: move.type!.nameJp,
                                    color: move.type!.color,
                                    fontSize: 8,
                                    height: 20,
                                    width: 60,
                                  ),
                            title: Text(move.nameJp),
                            onTap: () {
                              final teamId = _buildEditParam.teamId;
                              if (teamId != null) {
                                // パーティ画面用
                                ref
                                    .read(buildEditViewModelProviderFamily(
                                            _buildEditParam)
                                        .notifier)
                                    .updateMoves(
                                        moveIndex: _moveIndex, moveId: move.id);
                              } else {
                                // ポケモン単体画面用
                                // TODO: ポケモン単体画面用
                              }
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
