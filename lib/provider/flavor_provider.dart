import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Flavor {
  dev,
  prod,
}

final flavorProvider = Provider<Flavor>((ref) => throw UnimplementedError());
