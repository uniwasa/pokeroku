import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon_type.dart';

part 'move.freezed.dart';

@freezed
class Move with _$Move {
  const Move._();

  const factory Move({
    required int id,
    required String identifier,
    @JsonKey(name: 'version_group_id') required int versionGroupId,
    @JsonKey(name: 'pokemon_move_method_id') required int pokemonMoveMethodId,
    required int level,
    required int? order,
    required int? power,
    required int pp,
    required int? accuracy,
    required int priority,
    @JsonKey(name: 'target_id') required int targetId,
    @JsonKey(name: 'damage_class_id') required int damageClassId,
    @JsonKey(name: 'effect_chance') required int? effectChance,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'flavor_text_jp') required String flavorTextJp,
    @JsonKey(name: 'item_identifier') required String? itemIdentifier,
    required PokemonType type,
    @JsonKey(name: 'damage_class_name_jp') required String damageClassNameJp,
  }) = _Move;

  factory Move.type(Map<String, dynamic> move, List<PokemonType> pokemonTypes) {
    final type =
        pokemonTypes.firstWhere((element) => element.id == move['type_id']);
    return Move(
      id: move['id'],
      identifier: move['identifier'],
      versionGroupId: move['version_group_id'],
      pokemonMoveMethodId: move['pokemon_move_method_id'],
      level: move['level'],
      order: move['order'],
      power: move['power'],
      pp: move['pp'],
      accuracy: move['accuracy'],
      priority: move['priority'],
      targetId: move['target_id'],
      damageClassId: move['damage_class_id'],
      effectChance: move['effect_chance'],
      nameJp: move['name_jp'],
      flavorTextJp: move['flavor_text_jp'],
      itemIdentifier: move['item_identifier'],
      type: type,
      damageClassNameJp: move['damage_class_name_jp'],
    );
  }

  Color get damageClassColor {
    if (damageClassId == 2)
      return Color(0xFFFF4400);
    else if (damageClassId == 3)
      return Color(0xFF2266CC);
    else
      return Color(0xFF999999);
  }
}
