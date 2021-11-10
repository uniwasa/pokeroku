import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DocumentReferenceConverter
    implements
        JsonConverter<DocumentReference<Map<String, dynamic>>?, Object?> {
  const DocumentReferenceConverter();

  @override
  DocumentReference<Map<String, dynamic>>? fromJson(Object? json) =>
      json as DocumentReference<Map<String, dynamic>>?;

  @override
  Object? toJson(DocumentReference<Map<String, dynamic>>? object) => object;
}
