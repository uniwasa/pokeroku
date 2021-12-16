import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AppErrorType {
  notFound,
  credentialAlreadyInUse,
  providerAlreadyLinked,
  unknown,
}

class AppError {
  late String message;
  late AppErrorType type;

  AppError(Exception? error) {
    if (error is FirebaseAuthException) {
      debugPrint('AppError(FirebaseException): '
          'type is ${error.code}, message is ${error.message}');
      switch (error.code) {
        case 'credential-already-in-use':
          type = AppErrorType.credentialAlreadyInUse;
          message = 'すでに連携済みのアカウントです';
          break;
        case 'provider-already-linked':
          type = AppErrorType.providerAlreadyLinked;
          message = 'ログイン済みです';
          break;
        default:
          type = AppErrorType.unknown;
          message = 'AppError(FirebaseException): $error';
      }
    } else if (error is FirebaseException) {
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
