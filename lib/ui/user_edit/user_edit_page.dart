import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/ui/user_edit/user_edit_view_model.dart';

class UserEditPage extends HookWidget {
  UserEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValue = useProvider(userEditViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント'),
      ),
      body: asyncValue.when(
        data: (appUser) {
          return Text(appUser.id ?? 'ID未設定');
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
