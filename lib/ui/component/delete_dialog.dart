import 'package:flutter/material.dart';

Future<bool?> showDeleteDialog({
  required BuildContext context,
  required String? title,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('削除'),
        content: Text(title != null ? title + 'を削除しますか？' : '削除しますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
  return result;
}
