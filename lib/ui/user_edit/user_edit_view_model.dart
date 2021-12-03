import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';

final userEditViewModelProvider =
    StateNotifierProvider<UserEditViewModel, AsyncValue<AppUser>>((ref) {
  return UserEditViewModel(
      read: ref.read, user: ref.watch(authServiceProvider));
});

class UserEditViewModel extends StateNotifier<AsyncValue<AppUser>> {
  UserEditViewModel({
    required Reader read,
    required User? user,
  })  : _read = read,
        _user = user,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final User? _user;

  Future<void> init() async {
    if (_user != null) {}
  }
}
