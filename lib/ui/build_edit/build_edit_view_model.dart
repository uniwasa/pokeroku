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

  Future<void> init() async {}
}
