import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../util.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  const Ability._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Ability({
    required int id,
    required String identifier,
    required int? slot,
    @JsonKey(fromJson: intToBool, defaultValue: false) required bool isHidden,
    required String nameJp,
    required String flavorTextJp,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}
