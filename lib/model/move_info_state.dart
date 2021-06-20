import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'move_info_state.freezed.dart';

@freezed
class MoveInfoState with _$MoveInfoState {
  const MoveInfoState._();

  const factory MoveInfoState(
      {required Move move,
      required AsyncValue<List<Pokemon>> asyncPokemons}) = _MoveInfoState;
}
