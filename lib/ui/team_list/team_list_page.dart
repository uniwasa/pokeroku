import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/empty_scroll_view.dart';
import 'package:pokeroku/ui/component/dialogs.dart';
import 'package:pokeroku/ui/component/pixel_image.dart';
import 'package:pokeroku/ui/navigation_page.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';
import 'package:pokeroku/ui/component/user_drawer.dart';

class TeamListPage extends HookConsumerWidget {
  TeamListPage({Key? key}) : super(key: key);

  final _padding = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(teamListViewModelProvider);
    final asyncTeamList = state.teamList;
    final isFetching = state.isFetching;
    final hasNext = state.hasNext;

    final pokemonList = ref.watch(pokemonListProvider).value;

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
                onPressed: asyncTeamList.value == null
                    ? null // 読み込み中ならdisabled
                    : () async {
                        final result = await showInputDialog(
                          context,
                          labelText: 'パーティ名',
                          initialValue: 'マイパーティ',
                        );
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
      body: asyncTeamList.when(
        data: (teamList) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (!isFetching &&
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
                  if (teamList.isEmpty) {
                    return EmptyScrollView();
                  } else {
                    return ListView.builder(
                      itemCount: teamList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final team = teamList[index];
                        final builds = team.builds;
                        final teamName = team.name;

                        final List<Widget> buildIcons =
                            pokemonList != null && builds != null
                                ? builds.map(
                                    (build) {
                                      final pokemon = pokemonList.firstWhere(
                                          (element) =>
                                              element.id == build.pokemonId);
                                      return PixelImage(pokemon.imageName);
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
                                              color:
                                                  Theme.of(context).hoverColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10.0),
                                              child: buildIcons
                                                      .elementAtOrNull(i) ??
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
        },
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  double _calcIconSize(
      {required BuildContext context, required double horizontalPadding}) {
    return (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            MediaQuery.of(context).padding.horizontal) /
        6;
  }
}
