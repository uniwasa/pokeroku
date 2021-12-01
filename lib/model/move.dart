import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/pokemon_type.dart';

part 'move.freezed.dart';
part 'move.g.dart';

@freezed
class Move with _$Move {
  const Move._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Move({
    required int id,
    required String identifier,
    int? versionGroupId,
    int? pokemonMoveMethodId,
    int? level,
    int? order,
    int? power,
    required int pp,
    int? accuracy,
    required int priority,
    required int targetId,
    required int damageClassId,
    int? effectChance,
    required String nameJp,
    required String flavorTextJp,
    String? itemIdentifier,
    required String damageClassNameJp,
    required int typeId,
    @JsonKey(ignore: true) PokemonType? type,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  factory Move.withType({
    required Map<String, dynamic> json,
    required List<PokemonType> typeList,
  }) {
    final move = Move.fromJson(json);
    final type = typeList.firstWhere((element) => element.id == move.typeId);
    return move.copyWith(type: type);
  }

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
      typeId: move['type_id'],
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
