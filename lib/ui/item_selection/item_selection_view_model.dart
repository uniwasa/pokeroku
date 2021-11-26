import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/model/item.dart';
import 'package:pokeroku/provider/item_list_provider.dart';

final itemSelectionViewModelProviderFamily = StateNotifierProvider.family
    .autoDispose<ItemSelectionViewModel, AsyncValue<List<Item>>,
        BuildEditParam>((ref, buildEditParam) {
  return ItemSelectionViewModel(
    itemList: ref.watch(itemListProvider),
    buildEditParam: buildEditParam,
  );
});

class ItemSelectionViewModel extends StateNotifier<AsyncValue<List<Item>>> {
  ItemSelectionViewModel({
    required AsyncValue<List<Item>> itemList,
    required BuildEditParam buildEditParam,
  })  : _itemList = itemList,
        _buildEditParam = buildEditParam,
        super(itemList) {
    init();
  }

  final AsyncValue<List<Item>> _itemList;
  final BuildEditParam _buildEditParam;

  @override
  void dispose() {
    print('bye from ' + this.toString());
    super.dispose();
  }

  Future<void> init() async {}
}
