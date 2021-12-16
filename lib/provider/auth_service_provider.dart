import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/app_error.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/provider/app_error_provider.dart';
import 'package:pokeroku/provider/auth_user_provider.dart';
import 'package:pokeroku/provider/firebase_providers.dart';
import 'package:pokeroku/repository/user_repository.dart';

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
  AuthCredential? _credential;

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
            final newUser =
                AppUser(id: authUser.uid, name: authUser.displayName);
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

  Future<void> linkOrSignInWithGoogle() async {
    try {
      final authUser = _asyncAuthUser.value;
      final appUser = state.value;
      if (authUser != null && appUser != null) {
        // 読み込み済みかつ、なにかしら認証済みなら
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final googleAccount = await googleSignIn.signIn();
        if (googleAccount != null) {
          final googleAuth = await googleAccount.authentication;
          _credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await authUser.linkWithCredential(_credential!);

          // linkWithCredentialしてもauthStateChanges走らないみたいだから自分でstate更新
          // linkWithCredential後のデータが欲しいのでcurrentUserから最新取得
          // authStateChangesの代わりにuserChanges使うのもありかも
          AppUser newUser = appUser.copyWith(
              authUser: _read(firebaseAuthProvider).currentUser);
          if (newUser.name == null) {
            // ユーザー名未設定ならアカウントのユーザー名で設定
            newUser = newUser.copyWith(name: googleAccount.displayName);
            await _read(userRepositoryProvider).updateUser(user: newUser);
          }
          state = AsyncData(newUser);
        }
      }
    } on Exception catch (e) {
      final appError = AppError(e);
      if (appError.type == AppErrorType.credentialAlreadyInUse) {
        // 連携済みのエラーならサインイン
        if (_credential != null) {
          try {
            await _read(firebaseAuthProvider)
                .signInWithCredential(_credential!);
          } on Exception catch (error) {
            _read(appErrorProvider.notifier).update((state) => AppError(error));
          }
        }
      } else {
        // それ以外のエラーなら
        _read(appErrorProvider.notifier).update((state) => appError);
      }
    }
  }
}
