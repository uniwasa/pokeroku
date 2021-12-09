import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/util/timestamp_converter.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    @JsonKey(ignore: true) String? id,
    String? name,
    @JsonKey(ignore: true) User? authUser,
    @TimestampConverter() DateTime? createdAt,
    @UpdatedTimestampConverter() DateTime? updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromJsonWithId(
      {required Map<String, dynamic> json, required String id}) {
    return AppUser.fromJson(json).copyWith(id: id);
  }
}
