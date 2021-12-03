// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$_$_AppUserFromJson(Map<String, dynamic> json) {
  return _$_AppUser(
    name: json['name'] as String,
    createdAt: const TimestampConverter().fromJson(json['createdAt']),
    updatedAt: const UpdatedTimestampConverter().fromJson(json['updatedAt']),
  );
}

Map<String, dynamic> _$_$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const UpdatedTimestampConverter().toJson(instance.updatedAt),
    };
