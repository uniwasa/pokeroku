import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/util/timestamp_converter.dart';

part 'build.freezed.dart';
part 'build.g.dart';

@freezed
class Build with _$Build {
  const Build._();

  factory Build({
    @JsonKey(ignore: true) String? id,
    required int pokemonId,
    int? itemId,
    @TimestampConverter() DateTime? createdAt,
    @UpdatedTimestampConverter() DateTime? updatedAt,
  }) = _Build;

  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);

  Map<String, dynamic> toJsonWithTeam(
      {required Team team, required DocumentReference teamRef}) {
    final json = toJson();
    json[BuildField.team] = {
      BuildField.ref: teamRef,
      BuildField.createdAt: team.createdAt,
    };
    return json;
  }
}

class BuildField {
  static const team = 'team';
  static const ref = 'ref';
  static const createdAt = 'createdAt';
}
