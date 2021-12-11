import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/util/document_reference_converter.dart';
import 'package:pokeroku/util/timestamp_converter.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();

  factory Team({
    @JsonKey(ignore: true) String? id,
    String? name,
    @JsonKey(ignore: true) List<Build>? builds,
    @JsonKey(includeIfNull: false)
    @DocumentReferenceConverter()
        DocumentReference<Map<String, dynamic>>? ref,
    @TimestampConverter() DateTime? createdAt,
    @UpdatedTimestampConverter() DateTime? updatedAt,
  }) = _Team;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  factory Team.fromJsonWithId(
      {required Map<String, dynamic> json, required String id}) {
    final buildMap = (json[TeamField.builds] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Map<String, dynamic>.from(e as Map)),
    );
    final builds = buildMap?.entries
        .map(
          (e) => Build(
            id: e.key,
            pokemonId: e.value[TeamField.pokemonId],
            itemId: e.value[TeamField.itemId],
            createdAt: (e.value[TeamField.createdAt] as Timestamp?)?.toDate(),
          ),
        )
        .toList();
    final sortedBuilds = sortBuilds(builds: builds);
    return Team.fromJson(json).copyWith(
      id: id,
      builds: sortedBuilds,
    );
  }
  static sortBuilds({required List<Build>? builds}) {
    return builds
      ?..sort((a, b) {
        final dateA = a.createdAt;
        final dateB = b.createdAt;
        if (dateA == null && dateB == null)
          return 0;
        else if (dateA == null)
          return 1;
        else if (dateB == null)
          return -1;
        else
          return -dateA.compareTo(dateB);
      });
  }

  static Map<String, dynamic> makeDenormalizedBuild(
      {required Build build, isDelete = false}) {
    final id = build.id!;
    final buildJson = build.toJson();
    final buildMap = {
      TeamField.pokemonId: buildJson[TeamField.pokemonId],
      TeamField.itemId: buildJson[TeamField.itemId],
      TeamField.createdAt: buildJson[TeamField.createdAt],
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
