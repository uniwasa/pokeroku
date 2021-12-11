import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/app_user.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/stat_set.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/build_repository.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

final buildEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<BuildEditViewModel, AsyncValue<Build>, BuildEditParam>(
        (ref, buildEditParam) {
  return BuildEditViewModel(
    read: ref.read,
    asyncUser: ref.watch(authServiceProvider),
    buildEditParam: buildEditParam,
  );
});

class BuildEditViewModel extends StateNotifier<AsyncValue<Build>>
    with ValidationMixin {
  BuildEditViewModel({
    required Reader read,
    required AsyncValue<AppUser> asyncUser,
    required BuildEditParam buildEditParam,
  })  : _read = read,
        _asyncUser = asyncUser,
        _buildEditParam = buildEditParam,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final AsyncValue<AppUser> _asyncUser;
  final BuildEditParam _buildEditParam;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    try {
      final userId = _asyncUser.data?.value.id;
      if (userId != null) {
        final teamId = _buildEditParam.teamId;
        final buildId = _buildEditParam.buildId;
        if (teamId != null) {
          final build = await _read(buildRepositoryProvider)
              .getBuild(userId: userId, teamId: teamId, buildId: buildId);
          if (build == null) {
            // buildが取得できなかった場合
            // TODO: エラー処理ちゃんとする
            state = AsyncError(Exception('該当のデータがみつかりませんでした'));
          } else {
            state = AsyncData(build);
            // 必須ではないがパーティ側も更新
            _read(teamEditViewModelProviderFamily(teamId).notifier)
                .replaceBuild(build: build);
          }
        }
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  void updateLevel({required int level}) {
    final build = state.data?.value;
    if (build != null) {
      state = AsyncData(build.copyWith(level: level));
    }
  }

  void updateIndividualValues(
      {required String statName, required int individualValue}) {
    final build = state.data?.value;
    if (build != null) {
      final individualValues = build.individualValues?.toJson() ?? {};
      individualValues[statName] = individualValue;
      final statSet = StatSet.fromJson(individualValues);
      state = AsyncData(build.copyWith(individualValues: statSet));
    }
  }

  void updateEffortValues(
      {required String statName, required int effortValue}) {
    final build = state.data?.value;
    if (build != null) {
      final effortValues = build.effortValues?.toJson() ?? {};
      effortValues[statName] = effortValue;
      final statSet = StatSet.fromJson(effortValues);
      state = AsyncData(build.copyWith(effortValues: statSet));
    }
  }

  void updateAbility({required int abilityId}) {
    final build = state.data?.value;
    if (build != null) {
      state = AsyncData(build.copyWith(abilityId: abilityId));
    }
  }

  void updateNature({required int natureId}) {
    final build = state.data?.value;
    if (build != null) {
      state = AsyncData(build.copyWith(natureId: natureId));
    }
  }

  void updateItem({required int itemId}) {
    final build = state.data?.value;
    if (build != null) {
      state = AsyncData(build.copyWith(itemId: itemId));
    }
  }

  void updateMoves({required int moveIndex, required int moveId}) {
    final build = state.data?.value;
    if (build != null) {
      final moves = [...build.moves ?? <int?>[]]..length = 4;
      moves[moveIndex] = moveId;
      state = AsyncData(build.copyWith(moves: moves));
    }
  }

  Future<bool> saveBuild() async {
    final build = state.data?.value;
    if (build != null) {
      if (build.effortValues == null ||
          build.effortValues?.isValidEffortValues() == true) {
        // 努力値が空か有効な努力値の場合
        final teamId = _buildEditParam.teamId;
        if (teamId != null) {
          // パーティ画面用
          _read(teamEditViewModelProviderFamily(teamId).notifier)
              .updateBuild(build: build);
        } else {
          // ポケモン単体画面用
          // TODO: ポケモン単体画面用
        }
        return true;
      }
    }
    return false;
  }
}
