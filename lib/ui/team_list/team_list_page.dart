import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/home.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

class TeamListPage extends StatelessWidget {
  TeamListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(),
      onDrawerChanged: (isOpen) {
        context.read(hideNavigationBarProvider).state = isOpen;
      },
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
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

        final pokemonList = useProvider(pokemonListProvider).data?.value;

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
                    final builds = team.builds;
                    final teamName = team.name;

                    final List<Widget> buildIcons = pokemonList != null &&
                            builds != null
                        ? builds.map(
                            (build) {
                              final pokemon = pokemonList.firstWhere(
                                  (element) => element.id == build.pokemonId);
                              return Image.asset(
                                pokemon.imageName,
                                isAntiAlias: true,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.none,
                              );
                            },
                          ).toList()
                        : [];

                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        final confirmResult = await _showDeleteConfirmDialog(
                            context: context, title: team.name);
                        return confirmResult;
                      },
                      onDismissed: (final direction) async {
                        await context
                            .read(teamListViewModelProvider.notifier)
                            .removeTeam(team: team);
                      },
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.teamEdit,
                              arguments: team.id);
                        },
                        title: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (teamName != null) Text(teamName),
                              if (builds != null)
                                Wrap(
                                  children: buildIcons,
                                ),
                            ],
                          ),
                        ),
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

  Future<bool?> _showDeleteConfirmDialog({
    required BuildContext context,
    required String? title,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('削除'),
          content: Text((title ?? 'パーティ') + 'を削除しますか？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return result;
  }
}
