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

  Color get damageClassColor {
    if (damageClassId == 2)
      return Color(0xFFEE5522);
    else if (damageClassId == 3)
      return Color(0xFF3366DD);
    else
      return Color(0xFF999999);
  }

  Widget get damageClassIcon {
    final String name;
    if (damageClassId == 2)
      name = 'assets/icons/seals/move-physical.png';
    else if (damageClassId == 3)
      name = 'assets/icons/seals/move-special.png';
    else
      name = 'assets/icons/seals/move-status.png';
    return Image.asset(
      name,
      fit: BoxFit.contain,
      colorBlendMode: BlendMode.srcIn,
      color: damageClassColor,
    );
  }
}
