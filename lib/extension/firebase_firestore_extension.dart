import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokeroku/const/collection_name.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  DocumentReference<Map<String, dynamic>> getUserDocRef(String userId) {
    return collection(CollectionName.users).doc(userId);
  }
}
