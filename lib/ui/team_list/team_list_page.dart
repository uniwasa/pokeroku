import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/model/team.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/ui/team_list/team_list_view_model.dart';

class TeamListPage extends StatelessWidget {
  TeamListPage({Key? key}) : super(key: key) {
    _provider = StateNotifierProvider.autoDispose<TeamListViewModel,
        AsyncValue<List<Team>>>((ref) {
      return TeamListViewModel(
        read: ref.read,
        user: ref.watch(authServiceProvider),
      );
    });
  }
  late final AutoDisposeStateNotifierProvider<TeamListViewModel,
      AsyncValue<List<Team>>> _provider;
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
        ],
        title: Text('パーティ'),
      ),
      body: HookBuilder(builder: (context) {
        useProvider(_provider.notifier);
        final text = FirebaseAuth.instance.currentUser == null ? 'なし' : 'あり';
        return Text(text);
      }),
    );
  }
}
