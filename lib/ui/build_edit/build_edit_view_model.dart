import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/stat.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/repository/build_repository.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

final buildEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<BuildEditViewModel, AsyncValue<Build>, BuildEditParam>(
        (ref, buildEditParam) {
  return BuildEditViewModel(
    read: ref.read,
    user: ref.watch(authServiceProvider),
    buildEditParam: buildEditParam,
  );
});

class BuildEditViewModel extends StateNotifier<AsyncValue<Build>>
    with ValidationMixin {
  BuildEditViewModel({
    required Reader read,
    required User? user,
    required BuildEditParam buildEditParam,
  })  : _read = read,
        _user = user,
        _buildEditParam = buildEditParam,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final User? _user;
  final BuildEditParam _buildEditParam;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    try {
      final userId = _user?.uid;
      if (userId != null) {
        final teamId = _buildEditParam.teamId;
        final buildId = _buildEditParam.buildId;
        if (teamId != null) {
          final build = await _read(buildRepositoryProvider)
              .getBuild(userId: userId, teamId: teamId, buildId: buildId);
          state = AsyncData(build);
          // 必須ではないがパーティ側も更新
          _read(teamEditViewModelProviderFamily(teamId).notifier)
              .replaceBuild(build: build);
        }
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  void updateEffortValues(
      {required String statName, required int effortValue}) {
    final build = state.data?.value;
    if (build != null) {
      final effortValues = build.effortValues?.toJson() ?? {};
      effortValues[statName] = effortValue;
      final stat = Stat.fromJson(effortValues);
      state = AsyncData(build.copyWith(effortValues: stat));
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
