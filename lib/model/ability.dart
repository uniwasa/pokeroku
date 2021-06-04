import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../util.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  const Ability._();

  const factory Ability({
    required int id,
    required String identifier,
    required int slot,
    @JsonKey(name: 'is_hidden', fromJson: intToBool) required bool isHidden,
    @JsonKey(name: 'name_jp') required String nameJp,
    @JsonKey(name: 'flavor_text_jp') required String flavorTextJp,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}
