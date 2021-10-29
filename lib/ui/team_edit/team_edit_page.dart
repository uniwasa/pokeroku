import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class TeamEditPage extends StatelessWidget {
  TeamEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (context) {
      final state = useProvider(teamEditViewModelProvider);

      final focusNode = useFocusNode();
      final textEditingController = useTextEditingController(text: 'initial');

      focusNode.addListener(() {
        if (focusNode.hasFocus == false) {
          print(textEditingController.text);
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
        ),
        body: Text('パーティ編集'),
      );
    });
  }
}
