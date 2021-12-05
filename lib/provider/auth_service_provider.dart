import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  AuthCredential? _credential;

  StreamSubscription<User?>? _authStateSubscription;
  AuthService(this._read) : super(null) {
    init();
  }
  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  Future<void> init() async {
    try {
      _authStateSubscription?.cancel();
      _authStateSubscription = _read(firebaseAuthProvider)
          .authStateChanges()
          .listen((User? user) async {
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

  Future<void> linkOrSignInWithGoogle() async {
    try {
      if (state != null) {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final googleAccount = await googleSignIn.signIn();
        if (googleAccount != null) {
          final googleAuth = await googleAccount.authentication;
          _credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await _read(firebaseAuthProvider)
              .currentUser
              ?.linkWithCredential(_credential!);

          print(FirebaseAuth.instance.currentUser);
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'credential-already-in-use') {
        if (_credential != null) {
          try {
            print('ログインします');
            await _read(firebaseAuthProvider)
                .signInWithCredential(_credential!);
            print('ログインしました');
          } on Exception catch (error) {
            print(error);
          }
        }
      } else if (error.code == 'provider-already-linked') {
        print('ログイン済み');
      }
    } on Exception catch (error) {
      print(error);
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
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
    } on Exception catch (error) {
      print(error.toString());
    }
  }
}
