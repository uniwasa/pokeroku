import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_edit_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';

final teamEditViewModelProvider = StateNotifierProvider.autoDispose<
    TeamEditViewModel, AsyncValue<TeamEditState>>((ref) {
  return TeamEditViewModel(
    read: ref.read,
    user: ref.watch(authServiceProvider),
  );
});

class TeamEditViewModel extends StateNotifier<AsyncValue<TeamEditState>> {
  TeamEditViewModel({
    required Reader read,
    required User? user,
  })  : _read = read,
        _user = user,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final User? _user;

  Future<void> init() async {}
}
