import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class TeamEditPage extends StatelessWidget {
  TeamEditPage({Key? key, required String id})
      : _id = id,
        super(key: key);

  final String _id;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final asyncValue = useProvider(teamEditViewModelProviderFamily(_id));
      final provider =
          context.read(teamEditViewModelProviderFamily(_id).notifier);

      return asyncValue.when(
        data: (teamEditState) {
          final team = teamEditState.team;
          final focusNode = useFocusNode();
          final textEditingController =
              useTextEditingController(text: team.name);

          focusNode.addListener(() {
            if (focusNode.hasFocus == false) {
              final updatedTeam =
                  team.copyWith(name: textEditingController.text);
              context
                  .read(teamEditViewModelProviderFamily(_id).notifier)
                  .updateTeam(updatedTeam: updatedTeam);
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 120, maxHeight: 32),
                child: IntrinsicWidth(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    focusNode: focusNode,
                    controller: textEditingController,
                  ),
                ),
              ),
              actions: [
                Container(
                  width: kToolbarHeight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.pokemonSelection,
                          arguments: provider);
                    },
                    icon: Icon(Icons.add),
                  ),
                )
              ],
            ),
            body: Center(child: Text('hello')),
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
