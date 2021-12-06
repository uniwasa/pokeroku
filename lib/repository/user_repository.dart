import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

abstract class UserRepository {
  Future<AppUser?> getUser({required String userId});
}

final userRepositoryProvider = Provider((ref) => UserRepositoryImpl(ref.read));

class UserRepositoryImpl implements UserRepository {
  final Reader _read;

  UserRepositoryImpl(this._read);

  @override
  Future<AppUser?> getUser({required String userId}) async {
    try {
      final userRef = _read(firebaseFirestoreProvider).getUserDocument(userId);
      final userDoc = await userRef.get();
      final userJson = userDoc.data();
      if (userDoc.exists && userJson != null)
        return AppUser.fromJsonWithId(json: userJson, id: userDoc.id);
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<void> createUser({required AppUser user}) async {
    try {
      final userId = user.id;
      if (userId != null)
        await _read(firebaseFirestoreProvider)
            .getUserDocument(userId)
            .set(user.toJson());
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}
