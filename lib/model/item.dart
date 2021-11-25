import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const Item._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Item({
    required int id,
    required String identifier,
    required String nameJp,
    required String flavorTextJp,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
