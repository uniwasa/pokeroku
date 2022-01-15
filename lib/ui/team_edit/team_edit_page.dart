import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/empty_scroll_view.dart';
import 'package:pokeroku/ui/component/dialogs.dart';
import 'package:pokeroku/ui/component/pixel_image.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class TeamEditPage extends StatelessWidget {
  TeamEditPage({Key? key, required String teamId})
      : _teamId = teamId,
        super(key: key);

  final String _teamId;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final asyncValue = ref.watch(teamEditViewModelProviderFamily(_teamId));
      final pokemonList = ref.watch(pokemonListProvider).value;
      final textEditingController = useTextEditingController();

      return asyncValue.when(
        data: (teamEditState) {
          final team = teamEditState.team;
          final builds = team.builds;
          textEditingController.text = team.name ?? '';

          return Scaffold(
            appBar: AppBar(
              title: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 120, maxHeight: 32),
                child: IntrinsicWidth(
                  child: Focus(
                    onFocusChange: (hasFocus) async {
                      if (hasFocus == false) {
                        final updatedTeam =
                            team.copyWith(name: textEditingController.text);
                        await ref
                            .read(teamEditViewModelProviderFamily(_teamId)
                                .notifier)
                            .updateTeam(updatedTeam: updatedTeam);
                      }
                    },
                    child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                      controller: textEditingController,
                    ),
                  ),
                ),
              ),
              actions: [
                Container(
                  width: kToolbarHeight,
                  child: IconButton(
                    onPressed: teamEditState.isAddable == true
                        ? () {
                            Navigator.pushNamed(
                                context, Routes.pokemonSelection,
                                arguments: _teamId);
                          }
                        : null,
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(teamEditViewModelProviderFamily(_teamId).notifier);
              },
              child: Builder(
                builder: (context) {
                  if (builds == null || builds.length == 0) {
                    return EmptyScrollView();
                  } else {
                    return ListView.builder(
                      itemCount: builds.length,
                      itemBuilder: (BuildContext context, int index) {
                        final build = builds[index];

                        if (pokemonList != null) {
                          final pokemon = pokemonList.firstWhere(
                              (element) => element.id == build.pokemonId);
                          final image = PixelImage(pokemon.imageName);

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
                                  context: context, title: pokemon.nameJp);
                              return confirmResult;
                            },
                            onDismissed: (final direction) async {
                              await ref
                                  .read(teamEditViewModelProviderFamily(_teamId)
                                      .notifier)
                                  .removeBuild(build: build);
                            },
                            child: ListTile(
                              leading: image,
                              title: Text(pokemon.nameJp),
                              onTap: () {
                                final buildId = build.id;
                                if (buildId != null) {
                                  Navigator.pushNamed(context, Routes.buildEdit,
                                      arguments: BuildEditParam(
                                        teamId: team.id,
                                        buildId: buildId,
                                        pokemonId: pokemon.id,
                                      ));
                                }
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          );
        },
        loading: () {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        },
        error: (error, _) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text(error.toString())),
          );
        },
      );
    });
  }
}
