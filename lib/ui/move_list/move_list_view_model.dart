import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/move.dart';
import 'package:pokeroku/provider/move_list_provider.dart';
import 'package:pokeroku/util.dart';

final moveListViewModelProvider =
    StateNotifierProvider<MoveListViewModel, AsyncValue<List<Move>>>((ref) {
  return MoveListViewModel(
      read: ref.read, moveList: ref.watch(moveListProvider));
});

class MoveListViewModel extends StateNotifier<AsyncValue<List<Move>>> {
  MoveListViewModel({
    required AsyncValue<List<Move>> moveList,
    required Reader read,
  })  : _read = read,
        super(moveList);

  final Reader _read;

  void searchForText(String input) {
    _read(moveListProvider).when(
      data: (moveList) {
        final filtered = moveList.where((move) {
          return hiraToKana(move.nameJp).contains(hiraToKana(input));
        }).toList();
        state = AsyncValue.data(filtered);
      },
      loading: () {
        state = AsyncValue.loading();
      },
      error: (error, _) {
        state = AsyncValue.error(error);
      },
    );
  }
}
