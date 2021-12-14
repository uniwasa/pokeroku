// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ability _$$_AbilityFromJson(Map<String, dynamic> json) => _$_Ability(
      id: json['id'] as int,
      identifier: json['identifier'] as String,
      slot: json['slot'] as int,
      isHidden: intToBool(json['is_hidden'] as int),
      nameJp: json['name_jp'] as String,
      flavorTextJp: json['flavor_text_jp'] as String,
    );

Map<String, dynamic> _$$_AbilityToJson(_$_Ability instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'slot': instance.slot,
      'is_hidden': instance.isHidden,
      'name_jp': instance.nameJp,
      'flavor_text_jp': instance.flavorTextJp,
    };
