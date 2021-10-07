import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/repository/team_repository.dart';

class TeamListViewModel extends StateNotifier<AsyncValue<List<Team>>> {
  TeamListViewModel({
    required Reader read,
    required User? user,
  })  : _read = read,
        _user = user,
        super(AsyncLoading()) {
    init();
  }

  final Reader _read;
  final User? _user;

  Future<void> init() async {
    print('環境を表示します');
    print(bool.fromEnvironment('dart.vm.product'));
    print(const String.fromEnvironment('FLAVOR'));
    final collection =
        await FirebaseFirestore.instance.collection('example').get();
    print(collection.docs.first.get('name'));

    //メイン処理
    getTeams();
  }

  Future<void> getTeams() async {
    try {
      final userId = _user?.uid;
      if (userId != null) {
        final teams =
            await _read(teamRepositoryProvider).getTeams(userId: userId);
        print(teams.first.name);
      }
    } catch (e) {
      state = AsyncError(e);
    }
  }
}
