import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/stat_set.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/util/timestamp_converter.dart';

part 'build.freezed.dart';
part 'build.g.dart';

@freezed
class Build with _$Build {
  const Build._();

  @JsonSerializable(explicitToJson: true)
  factory Build({
    @JsonKey(ignore: true) String? id,
    required int pokemonId,
    int? abilityId,
    int? natureId,
    int? itemId,
    StatSet? individualValues,
    StatSet? effortValues,
    @JsonKey(ignore: true) Team? team,
    @TimestampConverter() DateTime? createdAt,
    @UpdatedTimestampConverter() DateTime? updatedAt,
  }) = _Build;

  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);

  factory Build.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    final team = Team.fromJson(data[BuildField.team]);

    return Build.fromJson(data).copyWith(id: doc.id, team: team);
  }

  Map<String, dynamic> toJsonWithTeam(
      {required Team team,
      required DocumentReference<Map<String, dynamic>> teamRef}) {
    final json = toJson();
    // 普通にTeamモデル初期化してそれのtoJson使うというてもあるが、いらないフィールドは含めてくないので手書き
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
