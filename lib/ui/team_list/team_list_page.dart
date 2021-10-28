import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team_list_state.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

class TeamListPage extends StatelessWidget {
  TeamListPage({Key? key}) : super(key: key) {
    _provider =
        StateNotifierProvider.autoDispose<TeamListViewModel, TeamListState>(
            (ref) {
      return TeamListViewModel(
        read: ref.read,
        user: ref.watch(authServiceProvider),
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<TeamListViewModel, TeamListState>
      _provider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read(authServiceProvider.notifier).signOut();
            },
            icon: Icon(Icons.logout)),
        actions: [
          Container(
            width: kToolbarHeight,
            child: IconButton(
                onPressed: () {
                  context
                      .read(authServiceProvider.notifier)
                      .signInAnonymously();
                },
                icon: Icon(Icons.login)),
          ),
          Container(
            width: kToolbarHeight,
            child: IconButton(
                onPressed: () {
                  print(context.read(authServiceProvider));
                  print(context.read(_provider));
                },
                icon: Icon(Icons.person)),
          ),
          Container(
            width: kToolbarHeight,
            child: IconButton(
                onPressed: () async {
                  await context.read(_provider.notifier).addTeam();
                },
                icon: Icon(Icons.add)),
          ),
        ],
        title: Text('パーティ'),
      ),
      body: HookBuilder(builder: (context) {
        final state = useProvider(_provider);
        final teams = state.teams;
        final isLoading = state.isLoading;
        final hasNext = state.hasNext;

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (!isLoading && hasNext && notification.metrics.extentAfter < 100)
              context.read(_provider.notifier).getNextTeams();

            return false;
          },
          child: Builder(
            builder: (context) {
              if (teams.isNotEmpty) {
                return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      height: 300,
                      child: Text(teams[index].name +
                          teams[index].createdAt.toString() +
                          teams[index].id.toString()),
                    ));
                  },
                );
              } else {
                final text =
                    FirebaseAuth.instance.currentUser == null ? 'なし' : 'あり';
                return Text(text);
              }
            },
          ),
        );
      }),
    );
  }
}
