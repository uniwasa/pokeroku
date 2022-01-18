import 'package:firebase_auth/firebase_auth.dart';

enum AuthMethodType {
  Google,
  Apple,
  Unknown,
}

class AuthMethod {
  late AuthMethodType type;

  AuthMethod(UserInfo userInfo) {
    switch (userInfo.providerId) {
      case 'google.com':
        type = AuthMethodType.Google;
        break;
      case 'apple.com':
        type = AuthMethodType.Apple;
        break;
      default:
        type = AuthMethodType.Unknown;
    }
  }
}
