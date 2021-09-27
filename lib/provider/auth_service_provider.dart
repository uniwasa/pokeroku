import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

final authServiceProvider = StateNotifierProvider<AuthService, User?>(
  (ref) {
    final user = ref.watch(authStateChangesProvider).data?.value;
    print('authの状態');
    print(ref.read(authStateChangesProvider).data);
    return AuthService(ref.read, user);
  },
);

class AuthService extends StateNotifier<User?> {
  // StreamSubscription<User?>? _authStateSubscription;
  final Reader _read;
  AuthService(this._read, User? state) : super(state) {
    init();
  }

  Future<void> init() async {
    try {
      // final firebaseAuth = FirebaseAuth.instance;
      // _authStateSubscription?.cancel();
      // _authStateSubscription = firebaseAuth
      //     .authStateChanges()
      //     .listen((user) => state = user);

      await signInAnonymously();
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
