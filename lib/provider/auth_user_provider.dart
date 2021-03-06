import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/firebase_providers.dart';

final authUserProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).userChanges();
});
