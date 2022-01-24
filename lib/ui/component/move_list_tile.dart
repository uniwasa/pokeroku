import 'package:flutter/material.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/util.dart';

class MoveListTile extends StatelessWidget {
  MoveListTile(
      {Key? key,
      required Move move,
      GestureTapCallback? onTap,
      bool isDetailPage = false})
      : _move = move,
        _onTap = onTap,
        _isDetailPage = isDetailPage,
        super(key: key);

  final Move _move;
  final GestureTapCallback? _onTap;
  final bool _isDetailPage;

  @override
  Widget build(BuildContext context) {
    Widget? trailing;
    if (_isDetailPage) {
      String trailingText = '';
      double fontSize = 14;
      if (_move.versionGroupId != 20) {
        trailingText = '剣盾では不確定';
        fontSize = 10;
      } else if (_move.pokemonMoveMethodId == 1) {
        trailingText = 'LV' + _move.level.toString();
      } else if (_move.pokemonMoveMethodId == 4) {
        trailingText = _move.itemIdentifier?.toUpperCase() ?? '';
      }
      trailing = Text(trailingText,
          style: TextStyle(color: Colors.white54, fontSize: fontSize));
    } else {
      trailing = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBadge(
            text: _move.damageClassNameJp,
            color: _move.damageClassColor,
            isSquare: true,
            fontSize: 10,
            width: 64,
          ),
        ],
      );
    }

    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_move.type != null) buildCircle(color: _move.type!.color),
        ],
      ),
      title: Text(_move.nameJp),
      trailing: trailing,
      onTap: _onTap,
    );
  }
}
