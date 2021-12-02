import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/pokemon.dart';

part 'ability_info_state.freezed.dart';

@freezed
class AbilityInfoState with _$AbilityInfoState {
  const AbilityInfoState._();

  const factory AbilityInfoState(
      {required Ability ability,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) = _AbilityInfoState;
}
