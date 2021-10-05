import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  DocumentReference getUserDocument(String userId) {
    return collection('users').doc(userId);
  }
}
