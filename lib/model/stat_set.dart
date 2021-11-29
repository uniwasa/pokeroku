import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stat_set.freezed.dart';
part 'stat_set.g.dart';

@freezed
class StatSet with _$StatSet {
  const StatSet._();

  factory StatSet({
    @Default(0) int hp,
    @Default(0) int attack,
    @Default(0) int defense,
    @Default(0) int specialAttack,
    @Default(0) int specialDefense,
    @Default(0) int speed,
  }) = _StatSet;

  factory StatSet.fromJson(Map<String, dynamic> json) =>
      _$StatSetFromJson(json);

  static List<String> get keys {
    return StatSet().toJson().keys.toList();
  }

  static Map<String, String> get abbr {
    final abbrList = ['HP', 'Atk', 'Def', 'SpA', 'SpD', 'Spe'];
    final Map<String, String> abbrMap = {};
    StatSet.keys
        .asMap()
        .forEach((index, element) => abbrMap[element] = abbrList[index]);
    return abbrMap;
  }

  List<int> values() {
    return List<int>.from(toJson().values.toList());
  }

  int sum() {
    return values().toList().sum;
  }

  bool isValidEffortValues() {
    return sum() <= 510;
  }
}
