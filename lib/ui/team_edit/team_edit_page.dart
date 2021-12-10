import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/build_edit_param.dart';
import 'package:pokeroku/provider/pokemon_list_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/empty_scroll_view.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class TeamEditPage extends StatelessWidget {
  TeamEditPage({Key? key, required String teamId})
      : _teamId = teamId,
        super(key: key);

  final String _teamId;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue = useProvider(teamEditViewModelProviderFamily(_teamId));
      final pokemonList = useProvider(pokemonListProvider).data?.value;
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
                    onFocusChange: (hasFocus) {
                      if (hasFocus == false) {
                        final updatedTeam =
                            team.copyWith(name: textEditingController.text);
                        context
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
                context
                    .refresh(teamEditViewModelProviderFamily(_teamId).notifier);
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
                          final image = Image.asset(
                            pokemon.imageName,
                            isAntiAlias: true,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.none,
                          );

                          return ListTile(
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
