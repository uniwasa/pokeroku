import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/build_edit_param.dart';

part 'move_selection_param.freezed.dart';

@freezed
class MoveSelectionParam with _$MoveSelectionParam {
  const MoveSelectionParam._();

  const factory MoveSelectionParam({
    required int moveIndex,
    required BuildEditParam buildEditParam,
  }) = _MoveSelectionParam;
}
