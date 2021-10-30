import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_edit_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

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

  final Reader _read;
  final User? _user;
  final String _id;

  @override
  void dispose() {
    print('bye');
    super.dispose();
  }

  Future<void> init() async {
    try {
      final userId = _user?.uid;
      if (userId != null) {
        final team = await _read(teamRepositoryProvider)
            .getTeam(userId: userId, teamId: _id);
        state = AsyncData(TeamEditState(team: team));
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> updateTeam({required Team updatedTeam}) async {
    try {
      final userId = _user?.uid;
      if (userId != null) {
        // Firestoreのデータ更新
        await _read(teamRepositoryProvider)
            .updateTeam(userId: userId, team: updatedTeam);
        // stateの更新(updatedAtは更新されてないが)
        state.whenData((teamEditState) {
          state = AsyncData(teamEditState.copyWith(team: updatedTeam));
        });
        // リスト側の更新
        _read(teamListViewModelProvider.notifier)
            .replaceTeam(targetTeam: updatedTeam);
      }
    } catch (e) {
      print(e);
      state = AsyncError(e);
    }
  }
}
