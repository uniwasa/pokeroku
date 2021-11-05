import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class IntListConverter implements JsonConverter<List<int>?, Object?> {
  const IntListConverter();

  @override
  List<int>? fromJson(Object? list) => list is List ? list.cast<int>() : null;

  @override
  Object? toJson(List<int>? list) =>
      list == null ? list : FieldValue.arrayUnion([list.last]);
}
