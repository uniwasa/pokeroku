import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

@freezed
class Stat with _$Stat {
  const Stat._();

  factory Stat({
    @Default(0) int hp,
    @Default(0) int attack,
    @Default(0) int defense,
    @Default(0) int specialAttack,
    @Default(0) int specialDefense,
    @Default(0) int speed,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  static List<String> keys() {
    return Stat().toJson().keys.toList();
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
