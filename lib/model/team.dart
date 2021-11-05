import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/util/timestamp_converter.dart';
import 'package:pokeroku/util/int_list_converter.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();

  factory Team({
    @JsonKey(ignore: true) String? id,
    required String name,
    @JsonKey(ignore: true) Map<String, Map<String, dynamic>>? builds,
    @TimestampConverter() DateTime? createdAt,
    @UpdatedTimestampConverter() DateTime? updatedAt,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  factory Team.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Team.fromJson(data).copyWith(
      id: doc.id,
      builds: (data[TeamField.builds] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, dynamic>.from(e as Map)),
      ),
    );
  }

  static Map<String, dynamic> makeBuildData(
      {required Build build, isDelete = false}) {
    final id = build.id!;
    final buildMap = {
      TeamField.pokemonId: build.pokemonId,
      TeamField.itemId: build.itemId,
      TeamField.createdAt: FieldValue.serverTimestamp(),
    };
    return {
      TeamField.builds + '.' + id: isDelete ? FieldValue.delete() : buildMap,
      TeamField.updatedAt: FieldValue.serverTimestamp(),
    };
  }
}

class TeamField {
  static const String builds = 'builds';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String pokemonId = 'pokemonId';
  static const String itemId = 'itemId';
}
