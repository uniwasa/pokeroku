import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

class TeamListPage extends StatelessWidget {
  TeamListPage({Key? key}) : super(key: key);

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
                  print(context.read(teamListViewModelProvider));
                },
                icon: Icon(Icons.person)),
          ),
          Container(
            width: kToolbarHeight,
            child: IconButton(
                onPressed: () async {
                  await context
                      .read(teamListViewModelProvider.notifier)
                      .addTeam();
                },
                icon: Icon(Icons.add)),
          ),
        ],
        title: Text('パーティ'),
      ),
      body: HookBuilder(builder: (context) {
        final state = useProvider(teamListViewModelProvider);
        final teams = state.teams;
        final isLoading = state.isLoading;
        final hasNext = state.hasNext;

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (!isLoading &&
                hasNext &&
                notification.metrics.extentAfter < 100) {
              context.read(teamListViewModelProvider.notifier).getNextTeams();
            }

            return false;
          },
          child: Builder(
            builder: (context) {
              if (teams.isNotEmpty) {
                return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (BuildContext context, int index) {
                    final team = teams[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.teamEdit,
                            arguments: team.id);
                      },
                      title: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white),
                          ),
                        ),
                        height: 100,
                        child: Text(team.name +
                            team.createdAt.toString() +
                            team.id.toString()),
                      ),
                    );
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
