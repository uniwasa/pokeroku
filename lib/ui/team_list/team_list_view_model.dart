import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/ability.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';

class TeamListViewModel extends StateNotifier<TeamListState> {
  TeamListViewModel({
    required PokedexDataSource dataSource,
    required User? user,
  })  : _dataSource = dataSource,
        _user = user,
        super(TeamListState(asyncText: AsyncValue.loading(), user: user)) {
    init();
  }

  final PokedexDataSource _dataSource;
  User? _user;

  Future<void> init() async {
    print(bool.fromEnvironment('dart.vm.product'));
    print(const String.fromEnvironment('FLAVOR'));
    final collection =
        await FirebaseFirestore.instance.collection('example').get();
    print(collection.docs.first.get('name'));
  }
}
