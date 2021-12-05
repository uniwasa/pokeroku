import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/ui/user_edit/user_edit_view_model.dart';

class UserEditPage extends HookWidget {
  UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValue = useProvider(userEditViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント'),
        actions: [
          Container(
            width: kToolbarHeight,
            child: IconButton(
                onPressed: () {
                  context.read(authServiceProvider.notifier).signOut();
                },
                icon: Icon(Icons.logout)),
          ),
        ],
      ),
      body: asyncValue.when(
        data: (appUser) {
          return Column(
            children: [
              Text(appUser.id ?? 'ID未設定'),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  context
                      .read(authServiceProvider.notifier)
                      .linkOrSignInWithGoogle();
                },
                child: Text('Googleログイン'),
              )
            ],
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
