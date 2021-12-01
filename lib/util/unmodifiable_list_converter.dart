import 'package:freezed_annotation/freezed_annotation.dart';

class UnmodifiableListConverter implements JsonConverter<List<int>?, Object?> {
  const UnmodifiableListConverter();

  @override
  List<int>? fromJson(Object? json) => json == null
      ? null
      : List.unmodifiable(
          (json as List<dynamic>).map((e) => e as int).toList());

  @override
  Object? toJson(List<int>? object) => object;
}
