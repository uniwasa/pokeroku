import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/app_error.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/app_error_provider.dart';
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
        super(TeamListState(
            teamList: AsyncLoading(), isFetching: false, hasNext: true)) {
    init();
  }

  final Reader _read;
  final AsyncValue<AppUser> _asyncUser;
  final limitNum = 10;

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
    if (state.isFetching || !state.hasNext) return;
    state = state.copyWith(isFetching: true, error: null);
    final teamList = state.teamList.value ?? [];

    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        print('次を取得します');
        final nextTeams = await _read(teamRepositoryProvider).getTeams(
          userId: userId,
          limitNum: limitNum,
          lastTeam: teamList.lastOrNull,
        );
        final hasNext = nextTeams.length >= limitNum;
        if (mounted)
          state = state.copyWith(
            teamList: AsyncData(teamList + nextTeams),
            isFetching: false,
            hasNext: hasNext,
            error: null,
          );
      }
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
      // エラー出ても読み込み続行させたいなら、isLoadingをfalseにすればいいが、とりま保留
      // falseにして、解消されないエラーだった場合、スクロール起こるたびずっと呼び出されてしまう
      // state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> addTeam({required String name}) async {
    try {
      final userId = _asyncUser.value?.id;
      final teamList = state.teamList.value;
      if (userId != null && teamList != null) {
        final newTeam = Team(name: name);
        final createdTeamId = await _read(teamRepositoryProvider)
            .createTeam(userId: userId, team: newTeam);
        final createdTeam = await _read(teamRepositoryProvider)
            .getTeam(userId: userId, teamId: createdTeamId);
        // TODO: ちゃんとエラー処理する
        if (mounted && createdTeam != null)
          state = state.copyWith(
              teamList: AsyncData(teamList..insert(0, createdTeam)));
      }
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
    }
  }

  Future<void> removeTeam({required Team team}) async {
    try {
      final userId = _asyncUser.value?.id;
      final teamList = state.teamList.value;
      if (userId != null && teamList != null) {
        await _read(teamRepositoryProvider)
            .deleteTeam(userId: userId, team: team);
        if (mounted)
          state = state.copyWith(
            teamList: AsyncData(
                teamList.where((element) => element.id != team.id).toList()),
          );
      }
    } on Exception catch (e) {
      _read(appErrorProvider.notifier).update((state) => AppError(e));
    }
  }

  void replaceTeam({required Team targetTeam}) {
    final teamList = state.teamList.value;
    if (mounted && teamList != null)
      state = state.copyWith(
        teamList: AsyncData(
          [
            for (final team in teamList)
              team.id == targetTeam.id ? targetTeam : team
          ],
        ),
      );
  }
}
