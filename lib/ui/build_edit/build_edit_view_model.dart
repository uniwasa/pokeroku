import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';

final buildEditViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<BuildEditViewModel, Build, BuildEditParameter>(
        (ref, buildEditParameter) {
  return BuildEditViewModel(
    build: buildEditParameter.build,
    buildManager: buildEditParameter.buildManager,
  );
});

class BuildEditViewModel extends StateNotifier<Build> {
  BuildEditViewModel({required Build build, required BuildManager buildManager})
      : _build = build,
        _buildManager = buildManager,
        individualValues = build.individualValues,
        effortValues = build.effortValues,
        super(build) {
    init();
  }

  final Build _build;
  final BuildManager _buildManager;

  //stateとは別に努力値と個体値のフィールド持つ
  Map<String, int>? individualValues;
  Map<String, int>? effortValues;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {
    print('initしました');
  }

  Future<void> updateEffortValues(Map<String, int> effortValues) async {
    // await Future.delayed(Duration(milliseconds: 2000));
    state = state.copyWith(effortValues: effortValues);
  }
}
