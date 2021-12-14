import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/model/pokemon.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/model/team_edit_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/build_repository.dart';
import 'package:pokeroku/repository/team_repository.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

//TODO riverpod 1.0.0になったらoverridesするときに使用
final teamEditViewModelProvider = StateNotifierProvider.autoDispose<
    TeamEditViewModel,
    AsyncValue<TeamEditState>>((ref) => throw UnimplementedError());

final teamEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<TeamEditViewModel, AsyncValue<TeamEditState>, String>(
        (ref, teamId) {
  return TeamEditViewModel(
    read: ref.read,
    asyncUser: ref.watch(authServiceProvider),
    teamId: teamId,
  );
});

class TeamEditViewModel extends StateNotifier<AsyncValue<TeamEditState>>
    implements BuildManager {
  TeamEditViewModel({
    required Reader read,
    required AsyncValue<AppUser> asyncUser,
    required String teamId,
  })  : _read = read,
        _asyncUser = asyncUser,
        _teamId = teamId,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final AsyncValue<AppUser> _asyncUser;
  final String _teamId;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        final team = await _read(teamRepositoryProvider)
            .getTeam(userId: userId, teamId: _teamId);
        if (team == null) {
          // teamが取得できなかった場合
          // TODO: エラー処理ちゃんとする
          state = AsyncError(Exception('該当のパーティがみつかりませんでした'));
        } else {
          final builds = await _read(buildRepositoryProvider)
              .getBuilds(userId: userId, team: team);
          final teamWithBuilds = team.copyWith(builds: builds);
          state = AsyncData(TeamEditState(
              team: teamWithBuilds, isAddable: _isAddable(builds)));
          // 必須ではないがリスト側も更新
          _read(teamListViewModelProvider.notifier)
              .replaceTeam(targetTeam: teamWithBuilds);
        }
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> updateTeam({required Team updatedTeam}) async {
    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        // Firestoreのデータ更新
        await _read(teamRepositoryProvider)
            .updateTeam(userId: userId, team: updatedTeam);
        // stateの更新(updatedAtは更新されてないが)
        final teamEditState = state.value;
        if (teamEditState != null) {
          state = AsyncData(teamEditState.copyWith(team: updatedTeam));
        }
        // リスト側の更新
        _read(teamListViewModelProvider.notifier)
            .replaceTeam(targetTeam: updatedTeam);
      }
    } catch (e) {
      print(e);
      state = AsyncError(e);
    }
  }

  @override
  Future<void> addBuild({required Pokemon pokemon}) async {
    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        final teamEditState = state.value;
        if (teamEditState != null) {
          state =
              AsyncData(teamEditState.copyWith(isAddable: false)); // 追加不可にする
          final team = teamEditState.team;
          final build = Build(pokemonId: pokemon.id);
          // Firestoreのデータ更新
          final buildId = await _read(buildRepositoryProvider)
              .createBuild(userId: userId, build: build, team: team);
          // 画面上のTeam更新
          final createdBuild = build.copyWith(id: buildId);
          final updatedBuilds = team.builds ?? [];
          updatedBuilds.insert(0, createdBuild);
          final updatedTeam = team.copyWith(builds: updatedBuilds);
          state = AsyncData(teamEditState.copyWith(
              team: updatedTeam, isAddable: _isAddable(updatedBuilds)));

          // リスト側の更新
          _read(teamListViewModelProvider.notifier)
              .replaceTeam(targetTeam: updatedTeam);
        }
      }
    } catch (e) {
      print(e);
      state = AsyncError(e);
    }
  }

  @override
  Future<void> updateBuild({required Build build}) async {
    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        final teamEditState = state.value;
        if (teamEditState != null) {
          final team = teamEditState.team;
          // Firestoreのデータ更新
          await _read(buildRepositoryProvider)
              .updateBuild(userId: userId, build: build, team: team);
          // 画面上の更新
          replaceBuild(build: build);
        }
      }
    } catch (e) {
      print(e);
      state = AsyncError(e);
    }
  }

  Future<void> removeBuild({required Build build}) async {
    try {
      final userId = _asyncUser.value?.id;
      if (userId != null) {
        final teamEditState = state.value;
        if (teamEditState != null) {
          final team = teamEditState.team;
          // Firestoreのデータ更新
          await _read(buildRepositoryProvider)
              .deleteBuild(userId: userId, build: build, team: team);
          // 画面上のTeam更新
          final updatedBuilds =
              team.builds?.where((element) => element.id != build.id).toList();
          final updatedTeam = team.copyWith(builds: updatedBuilds);
          state = AsyncData(teamEditState.copyWith(team: updatedTeam));
          // リスト側の更新
          _read(teamListViewModelProvider.notifier)
              .replaceTeam(targetTeam: updatedTeam);
        }
      }
    } catch (e) {
      print(e);
      state = AsyncError(e);
    }
  }

  void replaceBuild({required Build build}) {
    final teamEditState = state.value;
    if (teamEditState != null) {
      final team = teamEditState.team;
      // 画面上のTeam更新
      final List<Build> updatedBuilds = [
        for (final existingBuild in team.builds ?? [])
          existingBuild.id == build.id ? build : existingBuild
      ];
      final updatedTeam = team.copyWith(builds: updatedBuilds);
      state = AsyncData(teamEditState.copyWith(team: updatedTeam));
      // リスト側の更新
      _read(teamListViewModelProvider.notifier)
          .replaceTeam(targetTeam: updatedTeam);
    }
  }

  bool _isAddable(List<Build> builds) => builds.length < 6;
}
