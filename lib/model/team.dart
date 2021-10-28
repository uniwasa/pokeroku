import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/util/timestamp_converter.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();

  factory Team({
    @JsonKey(ignore: true) String? id,
    required String name,
    @TimestampConverter() DateTime? createdAt,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  factory Team.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Team.fromJson(doc.data()!).copyWith(id: doc.id);
  }
}
