import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';

final _absorbingProvider = StateProvider.autoDispose((ref) => false);

class UserDrawer extends HookWidget {
  UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValue = useProvider(authServiceProvider);

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
                          Icons.account_circle,
                          size: 50,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authUser.isAnonymous == true
                                    ? '未認証ユーザー'
                                    : appUser.name ?? 'ユーザー名未設定',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                authUser.isAnonymous == true
                                    ? '下記のアカウントで連携できます (連携済みのアカウントを選択するとログインできます)'
                                    : '連携済み',
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
              if (authUser.isAnonymous == true)
                HookBuilder(builder: (context) {
                  final absorbing = useProvider(_absorbingProvider).state;
                  return AbsorbPointer(
                    absorbing: absorbing,
                    child: Column(
                      children: [
                        SignInButton(
                          Buttons.Google,
                          onPressed: () async {
                            context.read(_absorbingProvider).state = true;

                            await context
                                .read(authServiceProvider.notifier)
                                .linkOrSignInWithGoogle();

                            context.read(_absorbingProvider).state = false;
                          },
                        )
                      ],
                    ),
                  );
                }),
              SizedBox(height: 20),
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
