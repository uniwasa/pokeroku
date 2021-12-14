// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Move _$$_MoveFromJson(Map<String, dynamic> json) => _$_Move(
      id: json['id'] as int,
      identifier: json['identifier'] as String,
      versionGroupId: json['version_group_id'] as int?,
      pokemonMoveMethodId: json['pokemon_move_method_id'] as int?,
      level: json['level'] as int?,
      order: json['order'] as int?,
      power: json['power'] as int?,
      pp: json['pp'] as int,
      accuracy: json['accuracy'] as int?,
      priority: json['priority'] as int,
      targetId: json['target_id'] as int,
      damageClassId: json['damage_class_id'] as int,
      effectChance: json['effect_chance'] as int?,
      nameJp: json['name_jp'] as String,
      flavorTextJp: json['flavor_text_jp'] as String,
      itemIdentifier: json['item_identifier'] as String?,
      damageClassNameJp: json['damage_class_name_jp'] as String,
      typeId: json['type_id'] as int,
    );

Map<String, dynamic> _$$_MoveToJson(_$_Move instance) => <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'version_group_id': instance.versionGroupId,
      'pokemon_move_method_id': instance.pokemonMoveMethodId,
      'level': instance.level,
      'order': instance.order,
      'power': instance.power,
      'pp': instance.pp,
      'accuracy': instance.accuracy,
      'priority': instance.priority,
      'target_id': instance.targetId,
      'damage_class_id': instance.damageClassId,
      'effect_chance': instance.effectChance,
      'name_jp': instance.nameJp,
      'flavor_text_jp': instance.flavorTextJp,
      'item_identifier': instance.itemIdentifier,
      'damage_class_name_jp': instance.damageClassNameJp,
      'type_id': instance.typeId,
    };
