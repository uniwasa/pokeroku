import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType {
  notFound,
  unknown,
}

class AppError {
  late String message;
  late AppErrorType type;

  AppError(Exception? error) {
    if (error is FirebaseException) {
      debugPrint('AppError(FirebaseException): '
          'type is ${error.code}, message is ${error.message}');
      switch (error.code) {
        case 'not-found':
          type = AppErrorType.notFound;
          message = '対象が見つかりませんでした';
          break;
        default:
          type = AppErrorType.unknown;
          message = 'AppError(FirebaseException): $error';
      }
    } else {
      debugPrint('AppError(UnKnown): $error');
      type = AppErrorType.unknown;
      message = 'AppError: $error';
    }
  }
}
