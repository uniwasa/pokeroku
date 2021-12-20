import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/home.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/empty_scroll_view.dart';
import 'package:pokeroku/ui/component/delete_dialog.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

class TeamListPage extends HookConsumerWidget {
  TeamListPage({Key? key}) : super(key: key);

  final _padding = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: UserDrawer(),
      onDrawerChanged: (isOpen) {
        ref.watch(hideNavigationBarProvider.notifier).state = isOpen;
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
                  final result = await _showInputDialog(context: context);
                  if (result != null)
                    await ref
                        .read(teamListViewModelProvider.notifier)
                        .addTeam(name: result);
                },
                icon: Icon(Icons.add)),
          ),
        ],
        title: Text('パーティ'),
      ),
      body: HookConsumer(builder: (context, ref, child) {
        final state = ref.watch(teamListViewModelProvider);
        final teams = state.teams;
        final isLoading = state.isLoading;
        final hasNext = state.hasNext;

        final pokemonList = ref.watch(pokemonListProvider).value;

        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (!isLoading &&
                hasNext &&
                notification.metrics.extentAfter < 100) {
              ref.read(teamListViewModelProvider.notifier).getNextTeams();
            }

            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(teamListViewModelProvider.notifier);
            },
            child: Builder(
              builder: (context) {
                if (teams.isEmpty) {
                  return EmptyScrollView();
                } else {
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
                        background: Container(
                          padding: EdgeInsets.only(
                            right: 20,
                          ),
                          alignment: AlignmentDirectional.centerEnd,
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (final direction) async {
                          final confirmResult = await showDeleteDialog(
                              context: context, title: team.name);
                          return confirmResult;
                        },
                        onDismissed: (final direction) async {
                          await ref
                              .read(teamListViewModelProvider.notifier)
                              .removeTeam(team: team);
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.all(_padding),
                          onTap: () {
                            Navigator.pushNamed(context, Routes.teamEdit,
                                arguments: team.id);
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: _padding),
                                child: Text(
                                  teamName ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  for (var i = 0; i < 6; i++)
                                    Container(
                                      width: _calcIconSize(
                                          context: context,
                                          horizontalPadding: _padding),
                                      height: _calcIconSize(
                                          context: context,
                                          horizontalPadding: _padding),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: _padding),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).hoverColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child:
                                                buildIcons.elementAtOrNull(i) ??
                                                    Container(),
                                          ),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }

  double _calcIconSize(
      {required BuildContext context, required double horizontalPadding}) {
    return (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            MediaQuery.of(context).padding.horizontal) /
        6;
  }

  Future<String?> _showInputDialog({required BuildContext context}) async {
    final result = await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return HookConsumer(builder: (context, ref, child) {
          final controller = ref.watch(_teamNameControllerProvider);
          return AlertDialog(
            content: TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "パーティ名")),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(null),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(controller.text),
                child: const Text('OK'),
              ),
            ],
          );
        });
      },
    );
    return result;
  }
}

final _teamNameControllerProvider = StateProvider.autoDispose((ref) {
  ref.onDispose(() => print('bye from _teamNameControllerProvider'));
  return TextEditingController(text: 'マイパーティ');
});
