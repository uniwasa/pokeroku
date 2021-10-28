import 'package:cloud_firestore/cloud_firestore.dart';

extension QueryDocumentSnapshotX on QueryDocumentSnapshot {
  Map<String, dynamic> dataWithId() {
    final result = data() as Map<String, dynamic>;
    result['id'] = id;
    return result;
  }
}
