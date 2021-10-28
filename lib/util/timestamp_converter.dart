import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? timestamp) =>
      timestamp is Timestamp ? timestamp.toDate() : null;

  @override
  Object? toJson(DateTime? dateTime) => dateTime == null
      ? FieldValue.serverTimestamp()
      : Timestamp.fromDate(dateTime);
}
