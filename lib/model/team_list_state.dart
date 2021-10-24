import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/team.dart';

part 'team_list_state.freezed.dart';

@freezed
class TeamListState with _$TeamListState {
  const TeamListState._();

  const factory TeamListState({
    required List<Team> teams,
    required bool isLoading,
    required bool hasNext,
    final String? error,
  }) = _TeamListState;
}
