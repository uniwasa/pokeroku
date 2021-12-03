import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/team.dart';

part 'team_edit_state.freezed.dart';

@freezed
class TeamEditState with _$TeamEditState {
  const TeamEditState._();

  const factory TeamEditState({
    required Team team,
    required bool isAddable,
  }) = _TeamEditState;
}
