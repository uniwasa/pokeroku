import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';

final teamListViewModelProvider =
    StateNotifierProvider.autoDispose<TeamListViewModel, TeamListState>((ref) {
  return TeamListViewModel(
    read: ref.read,
    user: ref.watch(authServiceProvider),
  );
});

class TeamListViewModel extends StateNotifier<TeamListState> {
  TeamListViewModel({
    required Reader read,
    required User? user,
  })  : _read = read,
        _user = user,
        super(TeamListState(teams: [], isLoading: false, hasNext: true)) {
    init();
  }

  final Reader _read;
  final User? _user;
  final limitNum = 2;

  Future<void> init() async {
    print('環境を表示します');
    print(bool.fromEnvironment('dart.vm.product'));
    print(const String.fromEnvironment('FLAVOR'));
    final collection =
        await FirebaseFirestore.instance.collection('example').get();
    print(collection.docs.first.get('name'));

    //メイン処理
    getNextTeams();
  }

  Future<void> getNextTeams() async {
    if (state.isLoading || !state.hasNext) return;

    state = state.copyWith(isLoading: true, error: null);
    final teams = state.teams;
    try {
      final userId = _user?.uid;
      if (userId != null) {
        print('次を取得します');
        final nextTeams = await _read(teamRepositoryProvider).getTeams(
          userId: userId,
          limitNum: limitNum,
          lastTeam: teams.isNotEmpty ? teams.last : null,
        );
        final hasNext = nextTeams.length >= limitNum;
        state = state.copyWith(
          teams: teams + nextTeams,
          isLoading: false,
          hasNext: hasNext,
          error: null,
        );
      }
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> addTeam() async {
    try {
      final userId = _user?.uid;
      if (userId != null) {
        final newTeam = Team(name: 'パーティ');
        final createdTeamId = await _read(teamRepositoryProvider)
            .createTeam(userId: userId, team: newTeam);
        final createdTeam = await _read(teamRepositoryProvider)
            .getTeam(userId: userId, teamId: createdTeamId);
        state = state.copyWith(teams: state.teams..insert(0, createdTeam));
      }
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
