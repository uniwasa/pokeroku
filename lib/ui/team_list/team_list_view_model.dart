import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

class TeamListViewModel extends StateNotifier<TeamListState> {
  TeamListViewModel({
    required PokedexDataSource dataSource,
  })  : _dataSource = dataSource,
        super(TeamListState(asyncText: AsyncValue.loading())) {
    init();
  }

  final PokedexDataSource _dataSource;

  Future<void> init() async {
    print(bool.fromEnvironment('dart.vm.product'));
    print(const String.fromEnvironment('FLAVOR'));
    final collection =
        await FirebaseFirestore.instance.collection('example').get();
    print(collection.docs.first.get('name'));
  }
}
