import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_edit_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';

//TODO riverpod 1.0.0になったらoverridesするときに使用
final teamEditViewModelProvider = StateNotifierProvider.autoDispose<
    TeamEditViewModel,
    AsyncValue<TeamEditState>>((ref) => throw UnimplementedError());

final teamEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<TeamEditViewModel, AsyncValue<TeamEditState>, String>(
        (ref, id) {
  return TeamEditViewModel(
    read: ref.read,
    user: ref.watch(authServiceProvider),
    id: id,
  );
});

class TeamEditViewModel extends StateNotifier<AsyncValue<TeamEditState>> {
  TeamEditViewModel({
    required Reader read,
    required User? user,
    required String id,
  })  : _read = read,
        _user = user,
        _id = id,
        super(AsyncLoading()) {
    init();
  }

  @override
  void dispose() {
    print('bye');
    super.dispose();
  }

  final Reader _read;
  final User? _user;
  final String _id;

  Future<void> init() async {
    print(_id);
  }
}
