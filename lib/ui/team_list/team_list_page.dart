import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/pokedex_data_source_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

class TeamListPage extends StatelessWidget {
  TeamListPage({Key? key}) : super(key: key) {
    _provider =
        StateNotifierProvider.autoDispose<TeamListViewModel, TeamListState>(
            (ref) {
      return TeamListViewModel(
        dataSource: ref.read(pokedexDataSourceProvider),
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<TeamListViewModel, TeamListState>
      _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Container(
            width: kToolbarHeight,
            child: Icon(Icons.add),
          ),
        ],
        title: Text('パーティ'),
      ),
      body: HookBuilder(builder: (context) {
        return Text('hello');
      }),
    );
  }
}
