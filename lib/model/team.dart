import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'team.freezed.dart';

@freezed
class Team with _$Team {
  factory Team({required String name}) = _Team;
}
