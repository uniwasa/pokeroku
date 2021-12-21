import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/provider/move_list_provider.dart';
import 'package:pokeroku/util.dart';

final moveSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<MoveSelectionViewModel, AsyncValue<List<Move>>,
        BuildEditParam>((ref, buildEditParam) {
  return MoveSelectionViewModel(
    read: ref.read,
    moveList: ref.watch(moveListProvider),
    buildEditParam: buildEditParam,
  );
});

class MoveSelectionViewModel extends StateNotifier<AsyncValue<List<Move>>> {
  MoveSelectionViewModel({
    required Reader read,
    required AsyncValue<List<Move>> moveList,
    required BuildEditParam buildEditParam,
  })  : _read = read,
        _moveList = moveList,
        _buildEditParam = buildEditParam,
        super(moveList) {
    init();
  }

  final Reader _read;
  final AsyncValue<List<Move>> _moveList;
  final BuildEditParam _buildEditParam;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}

  void searchForText(String input) {
    _read(moveListProvider).whenData((list) {
      final filtered = list.where((element) {
        return hiraToKana(element.nameJp).contains(hiraToKana(input));
      }).toList();
      state = AsyncValue.data(filtered);
    });
  }
}
