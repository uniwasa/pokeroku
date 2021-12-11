import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/team_repository.dart';

final teamListViewModelProvider =
    StateNotifierProvider.autoDispose<TeamListViewModel, TeamListState>((ref) {
  return TeamListViewModel(
    read: ref.read,
    asyncUser: ref.watch(authServiceProvider),
  );
});

class TeamListViewModel extends StateNotifier<TeamListState> {
  TeamListViewModel({
    required Reader read,
    required AsyncValue<AppUser> asyncUser,
  })  : _read = read,
        _asyncUser = asyncUser,
        super(TeamListState(teams: [], isLoading: false, hasNext: true)) {
    init();
  }

  final Reader _read;
  final AsyncValue<AppUser> _asyncUser;
  final limitNum = 2;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    await getNextTeams();
  }

  Future<void> getNextTeams() async {
    // TODO: userIdチェックしたあとでよさそう
    if (!mounted) return;
    if (state.isLoading || !state.hasNext) return;
    state = state.copyWith(isLoading: true, error: null);
    final teams = state.teams;

    try {
      final userId = _asyncUser.data?.value.id;
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
      final userId = _asyncUser.data?.value.id;
      if (userId != null) {
        final newTeam = Team(name: 'パーティ');
        final createdTeamId = await _read(teamRepositoryProvider)
            .createTeam(userId: userId, team: newTeam);
        final createdTeam = await _read(teamRepositoryProvider)
            .getTeam(userId: userId, teamId: createdTeamId);
        // TODO: ちゃんとエラー処理する
        if (createdTeam != null)
          state = state.copyWith(teams: state.teams..insert(0, createdTeam));
      }
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> removeTeam({required Team team}) async {
    try {
      final userId = _asyncUser.data?.value.id;
      if (userId != null) {
        await _read(teamRepositoryProvider)
            .deleteTeam(userId: userId, team: team);
        state = state.copyWith(
          teams: state.teams.where((element) => element.id != team.id).toList(),
        );
      }
    } catch (e) {
      print(e);
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> replaceTeam({required Team targetTeam}) async {
    state = state.copyWith(
      teams: [
        for (final team in state.teams)
          team.id == targetTeam.id ? targetTeam : team
      ],
    );
  }
}
