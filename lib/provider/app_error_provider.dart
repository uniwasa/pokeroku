import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/app_error.dart';

final appErrorProvider = StateProvider<AppError?>((ref) => null);
