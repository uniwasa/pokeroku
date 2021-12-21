import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/item.dart';
import 'package:pokeroku/provider/item_list_provider.dart';
import 'package:pokeroku/util.dart';

final itemSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<ItemSelectionViewModel, AsyncValue<List<Item>>,
        BuildEditParam>((ref, buildEditParam) {
  return ItemSelectionViewModel(
    read: ref.read,
    itemList: ref.watch(itemListProvider),
    buildEditParam: buildEditParam,
  );
});

class ItemSelectionViewModel extends StateNotifier<AsyncValue<List<Item>>> {
  ItemSelectionViewModel({
    required Reader read,
    required AsyncValue<List<Item>> itemList,
    required BuildEditParam buildEditParam,
  })  : _read = read,
        _itemList = itemList,
        _buildEditParam = buildEditParam,
        super(itemList) {
    init();
  }

  final Reader _read;
  final AsyncValue<List<Item>> _itemList;
  final BuildEditParam _buildEditParam;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}

  void searchForText(String input) {
    _read(itemListProvider).whenData((list) {
      final filtered = list.where((element) {
        return hiraToKana(element.nameJp).contains(hiraToKana(input));
      }).toList();
      state = AsyncValue.data(filtered);
    });
  }
}
