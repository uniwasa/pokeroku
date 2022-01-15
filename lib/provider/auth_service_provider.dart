import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/app.dart';
import 'package:pokeroku/app_error.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/provider/app_error_provider.dart';
import 'package:pokeroku/provider/auth_user_provider.dart';
import 'package:pokeroku/provider/firebase_providers.dart';
import 'package:pokeroku/repository/user_repository.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// TODO: Riverpod1.0.0ではこの書き方できるらしいから、authServiceProviderじゃなくてこっちをref.watchするように変更
// final userIdProvider = Provider<String?>(
//   (ref) {
//     final userId =
//         ref.watch(authServiceProvider.select((value) => value.data?.value.id));
//     return userId;
//   },
// );

final authServiceProvider =
    StateNotifierProvider<AuthService, AsyncValue<AppUser>>(
  (ref) {
    return AuthService(
        read: ref.read, asyncAuthUser: ref.watch(authUserProvider));
  },
);

class AuthService extends StateNotifier<AsyncValue<AppUser>> {
  AuthService({
    required Reader read,
    required AsyncValue<User?> asyncAuthUser,
  })  : _read = read,
        _asyncAuthUser = asyncAuthUser,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final AsyncValue<User?> _asyncAuthUser;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    _asyncAuthUser.whenData((authUser) async {
      // 読み込み済み
      try {
        if (authUser == null) {
          // 未認証の場合
          await _read(firebaseAuthProvider).signInAnonymously();
        } else {
          // 認証済みの場合
          final user =
              await _read(userRepositoryProvider).getUser(userId: authUser.uid);
          if (user != null) {
            // 認証済みで、userドキュメント作成済みの場合
            state = AsyncData(user.copyWith(authUser: authUser));
          } else {
            // 認証済みだが、userドキュメント未作成の場合
            final newUser = AppUser(id: authUser.uid);
            await _read(userRepositoryProvider).createUser(user: newUser);
            final createdUser = await _read(userRepositoryProvider)
                .getUser(userId: authUser.uid);
            if (createdUser != null)
              state = AsyncData(createdUser.copyWith(authUser: authUser));
          }
        }
      } on Exception catch (e) {
        _read(appErrorProvider.notifier).update((state) => AppError(e));
      }
    });
  }

  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
    }
  }

  Future<bool> signInWithGoogle({required bool isSignUp}) async {
    try {
      final authUser = _asyncAuthUser.value;
      final appUser = state.value;
      if (authUser != null && appUser != null) {
        // 読み込み済みかつ、なにかしら認証済みなら
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final googleAccount = await googleSignIn.signIn();

        if (googleAccount == null) return false;
        final googleAuth = await googleAccount.authentication;
        final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await (isSignUp
            ? authUser.linkWithCredential(googleCredential)
            : _read(firebaseAuthProvider)
                .signInWithCredential(googleCredential));
      }
      return true;
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
      return false;
    }
  }

  Future<bool> signInWithApple({required bool isSignUp}) async {
    try {
      final authUser = _asyncAuthUser.value;
      final appUser = state.value;
      if (authUser != null && appUser != null) {
        // 読み込み済みかつ、なにかしら認証済みなら
        final rawNonce = _generateNonce();
        final nonce = _sha256ofString(rawNonce);

        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: nonce,
        );

        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          rawNonce: rawNonce,
        );
        await (isSignUp
            ? authUser.linkWithCredential(oauthCredential)
            : _read(firebaseAuthProvider)
                .signInWithCredential(oauthCredential));
      }
      return true;
    } on Exception catch (e) {
      final appError = AppError(e);
      // 操作がキャンセルされたとき以外は、エラーを設定
      if (appError.type != AppErrorType.authorizationCanceled)
        _read(appErrorProvider.notifier).update((state) => appError);
      return false;
    }
  }

  Future<void> updateUser(AppUser appUser) async {
    try {
      await _read(userRepositoryProvider).updateUser(user: appUser);
      if (mounted) state = AsyncData(appUser); // updatedAtは更新されてない
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
    }
  }

  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
