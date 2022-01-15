import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/auth_service_provider.dart';
import 'package:pokeroku/ui/component/custom_sign_in_button.dart';

final _absorbingProvider = StateProvider.autoDispose((ref) => false);

class SignInPage extends StatelessWidget {
  SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: TabBar(
            tabs: [Tab(text: '新規登録'), Tab(text: 'ログイン')],
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,
            // indicatorPadding: EdgeInsets.only(bottom: 8),
            indicatorWeight: 3,
            // labelPadding: EdgeInsets.only(top: 10),
          ),
        ),
        body: TabBarView(
          children: [
            _buildButtons(isSignUp: true),
            _buildButtons(isSignUp: false)
          ],
        ),
      ),
    );
  }

  Widget _buildButtons({required bool isSignUp}) {
    return HookConsumer(
      builder: (context, ref, child) {
        final absorbing = ref.watch(_absorbingProvider);
        return AbsorbPointer(
          absorbing: absorbing,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              children: [
                CustomSignInButton(
                  icon: Image.asset('assets/google.png', height: 19),
                  labelText: 'Googleでサイン' + (isSignUp ? 'アップ' : 'イン'),
                  onPressed: () async {
                    ref.watch(_absorbingProvider.notifier).state = true;
                    final result = await ref
                        .read(authServiceProvider.notifier)
                        .signInWithGoogle(isSignUp: isSignUp);
                    ref.watch(_absorbingProvider.notifier).state = false;
                    if (result) Navigator.pop(context);
                  },
                ),
                if (Theme.of(context).platform == TargetPlatform.iOS)
                  CustomSignInButton(
                    icon: FaIcon(FontAwesomeIcons.apple, size: 22),
                    labelText: 'Appleでサイン' + (isSignUp ? 'アップ' : 'イン'),
                    onPressed: () async {
                      ref.watch(_absorbingProvider.notifier).state = true;
                      final result = await ref
                          .read(authServiceProvider.notifier)
                          .signInWithApple(isSignUp: isSignUp);
                      ref.watch(_absorbingProvider.notifier).state = false;
                      if (result) Navigator.pop(context);
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isSignUp
                        ? '初めてご利用になる方は、こちらより新規登録を行うとデータをアカウントに紐づけることができます'
                        : '以前ご利用のあった方は、こちらよりログインしていただくとデータを引き継ぐことができます',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
