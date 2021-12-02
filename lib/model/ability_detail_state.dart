import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'ability_detail_state.freezed.dart';

@freezed
class AbilityDetailState with _$AbilityDetailState {
  const AbilityDetailState._();

  const factory AbilityDetailState(
          {required Ability ability,
          required AsyncValue<List<Pokemon>> asyncPokemonList}) =
      _AbilityDetailState;
}
