import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/provider/ability_list_provider.dart';
import 'package:pokeroku/util.dart';

final abilityListViewModelProvider =
    StateNotifierProvider<AbilityListViewModel, AsyncValue<List<Ability>>>(
        (ref) {
  return AbilityListViewModel(
      read: ref.read, abilityList: ref.watch(abilityListProvider));
});

class AbilityListViewModel extends StateNotifier<AsyncValue<List<Ability>>> {
  AbilityListViewModel({
    required AsyncValue<List<Ability>> abilityList,
    required Reader read,
  })  : _read = read,
        super(abilityList);

  final Reader _read;

  void searchForText(String input) {
    _read(abilityListProvider).when(
      data: (abilityList) {
        final filtered = abilityList.where((ability) {
          return hiraToKana(ability.nameJp).contains(hiraToKana(input));
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
