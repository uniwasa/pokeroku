// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      name: json['name'] as String?,
      ref: const DocumentReferenceConverter().fromJson(json['ref']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const UpdatedTimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ref', const DocumentReferenceConverter().toJson(instance.ref));
  val['createdAt'] = const TimestampConverter().toJson(instance.createdAt);
  val['updatedAt'] =
      const UpdatedTimestampConverter().toJson(instance.updatedAt);
  return val;
}
