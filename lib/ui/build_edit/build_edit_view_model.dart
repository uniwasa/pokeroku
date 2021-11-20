import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/mixin/validation_mixin.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';
import 'package:pokeroku/model/stat.dart';

final buildEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<BuildEditViewModel, Build, BuildEditParameter>(
        (ref, buildEditParameter) {
  return BuildEditViewModel(
    build: buildEditParameter.build,
    buildManager: buildEditParameter.buildManager,
  );
});

class BuildEditViewModel extends StateNotifier<Build> with ValidationMixin {
  BuildEditViewModel({required Build build, required BuildManager buildManager})
      : _build = build,
        _buildManager = buildManager,
        super(build) {
    init();
  }

  final Build _build;
  final BuildManager _buildManager;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    print('initしました');
  }

  void updateEffortValues(
      {required String statName, required int effortValue}) {
    final effortValues = state.effortValues?.toJson() ?? {};
    effortValues[statName] = effortValue;
    final stat = Stat.fromJson(effortValues);
    state = state.copyWith(effortValues: stat);
  }

  Future<bool> saveBuild() async {
    if (state.effortValues == null ||
        state.effortValues?.isValidEffortValues() == true) {
      // 努力値が空か有効な努力値の場合
      _buildManager.updateBuild(build: state);
      return true;
    } else {
      return false;
    }
  }
}
