// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as int,
      identifier: json['identifier'] as String,
      nameJp: json['name_jp'] as String,
      flavorTextJp: json['flavor_text_jp'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name_jp': instance.nameJp,
      'flavor_text_jp': instance.flavorTextJp,
    };
