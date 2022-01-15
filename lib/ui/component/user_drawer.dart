import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/routes.dart';
import 'package:pokeroku/ui/component/rounded_button.dart';

class UserDrawer extends HookConsumerWidget {
  UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(authServiceProvider);

    final drawerContent = asyncValue.when(
      data: (appUser) {
        final authUser = appUser.authUser;
        if (authUser == null) return Center(child: CircularProgressIndicator());
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Theme.of(context).hintColor,
                        ),
                        SizedBox(width: 10.0),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authUser.isAnonymous
                                    ? 'ゲストユーザー'
                                    : appUser.name ?? 'ユーザー名未設定',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              if (authUser.isAnonymous)
                                Text(
                                  '下のボタンより新規登録/ログインできます',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                height: 150,
              ),
              SizedBox(height: 20),
              if (authUser.isAnonymous)
                HookConsumer(builder: (context, ref, child) {
                  return RoundedButton(
                    child: Text('新規登録 / ログイン'),
                    color: Colors.blueAccent,
                    onPressed: () async {
                      Navigator.pushNamed(context, Routes.signIn);
                    },
                  );
                })
              else
                RoundedButton(
                  child: Text('ログアウト'),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('ログアウト'),
                          content: Text('ログアウトしますか？'),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: Text("OK"),
                              onPressed: () async {
                                await ref
                                    .read(authServiceProvider.notifier)
                                    .signOut();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
            ],
          ),
        );
      },
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(error.toString()),
      ),
    );
    return Drawer(
      child: drawerContent,
    );
  }
}
