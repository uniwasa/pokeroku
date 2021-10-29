import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/team_edit/team_edit_view_model.dart';

class TeamEditPage extends StatelessWidget {
  TeamEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('パーティ編集'),
      ),
      body: HookBuilder(builder: (context) {
        final state = useProvider(teamEditViewModelProvider);

        return Text('パーティ編集');
      }),
    );
  }
}
