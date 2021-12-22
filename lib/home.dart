import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/app_error.dart';
import 'package:pokeroku/provider/app_error_provider.dart';
import 'package:pokeroku/provider/version_check_provider.dart';
import 'package:pokeroku/ui/navigation_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      ref.listen<AppError?>(appErrorProvider, (previousError, newError) {
        if (newError != null)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                newError.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
      });

      ref.listen<AsyncValue<bool>>(versionCheckProvider,
          (previousVersionCheck, newVersionCheck) {
        // 新しいアプリバージョンがある場合はダイアログを表示する
        if (newVersionCheck.value == true) _showUpdateDialog(context);
      });

      return NavigationPage();
    });
  }

  void _showUpdateDialog(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog<void>(
        context: context,
        // ダイアログの外をタップしても閉じられないようにする
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            // AndroidのBackボタンで閉じられないようにする
            onWillPop: () async => false,
            child: AlertDialog(
              content: const Text(
                '新しいバージョンがあります。\nアップデートをお願いします。',
              ),
              // actions: [
              //   TextButton(
              //     onPressed: () {
              //       // TODO: App Store or Google Play に飛ばす処理
              //       Navigator.of(context).pop();
              //     },
              //     child: const Text('アップデート'),
              //   ),
              // ],
            ),
          );
        },
      );
    });
  }
}
