import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';

part 'team_list_state.freezed.dart';

@freezed
class TeamListState with _$TeamListState {
  const TeamListState._();

  const factory TeamListState({
    required AsyncValue<List<Team>> teamList,
    required bool isFetching,
    required bool hasNext,
    final String? error,
  }) = _TeamListState;
}
