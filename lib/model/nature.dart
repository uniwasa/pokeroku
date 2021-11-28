import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/stat_set.dart';
import 'package:recase/recase.dart';

part 'nature.freezed.dart';
part 'nature.g.dart';

@freezed
class Nature with _$Nature {
  const Nature._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Nature({
    required int id,
    required String identifier,
    required String nameJp,
    required String decreasedStatIdentifier,
    required String increasedStatIdentifier,
  }) = _Nature;

  factory Nature.fromJson(Map<String, dynamic> json) => _$NatureFromJson(json);

  StatSet get rate {
    final defaultStatSet = StatSet(
      hp: 100,
      attack: 100,
      defense: 100,
      specialAttack: 100,
      specialDefense: 100,
      speed: 100,
    );
    if (decreasedStatIdentifier == increasedStatIdentifier)
      return defaultStatSet;

    final statSetMap = defaultStatSet.toJson();
    statSetMap[decreasedStatIdentifier.camelCase] = 90;
    statSetMap[increasedStatIdentifier.camelCase] = 110;
    return StatSet.fromJson(statSetMap);
  }
}
