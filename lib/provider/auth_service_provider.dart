import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/extension/firebase_firestore_extension.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

final authServiceProvider = StateNotifierProvider<AuthService, User?>(
  (ref) {
    return AuthService(ref.read);
  },
);

class AuthService extends StateNotifier<User?> {
  final Reader _read;
  AuthService(this._read) : super(null) {
    init();
  }

  Future<void> init() async {
    try {
      _read(firebaseAuthProvider).authStateChanges().listen((User? user) async {
        await createUserDoc(user); // signInAnonymouslyしたらまた呼び出されるから先に記述
        state = user; // userのdocumentが作られてからstate更新

        await signInAnonymously(); // もし未ログインのときのみ実行される
      });
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  Future<void> signInAnonymously() async {
    try {
      if (state == null) {
        await _read(firebaseAuthProvider).signInAnonymously();
      }
    } on Exception catch (error) {
      print(error.toString());
    }
  }

  Future<void> createUserDoc(User? user) async {
    try {
      if (user != null) {
        final userDoc = await _read(firebaseFirestoreProvider)
            .getUserDocument(user.uid)
            .get();
        if (!userDoc.exists) {
          userDoc.reference.set({
            'name': user.displayName,
            'created_at': FieldValue.serverTimestamp(),
          });
        }
      }
    } on Exception catch (error) {
      print(error.toString());
    }
  }
}
