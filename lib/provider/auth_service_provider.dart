import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

final authServiceProvider = StateNotifierProvider<AuthService, User?>(
  (ref) {
    return AuthService(ref.read);
  },
);

class AuthService extends StateNotifier<User?> {
  final Reader _read;
  AuthService(this._read) : super(_read(firebaseAuthProvider).currentUser) {
    init();
  }

  Future<void> init() async {
    try {
      _read(firebaseAuthProvider).authStateChanges().listen((User? user) async {
        state = user;
        await signInAnonymously();
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
}
