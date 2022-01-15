import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

Future<String?> showInputDialog(
  BuildContext context, {
  required String labelText,
  String? initialValue,
}) async {
  final result = await showDialog<String?>(
    context: context,
    builder: (BuildContext context) {
      return HookConsumer(builder: (context, ref, child) {
        final controller = useTextEditingController(text: initialValue);
        return AlertDialog(
          content: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: labelText)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('OK'),
            ),
          ],
        );
      });
    },
  );
  return result;
}
