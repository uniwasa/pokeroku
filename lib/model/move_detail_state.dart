import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'move_detail_state.freezed.dart';

@freezed
class MoveDetailState with _$MoveDetailState {
  const MoveDetailState._();

  const factory MoveDetailState(
      {required Move move,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) = _MoveDetailState;
}
