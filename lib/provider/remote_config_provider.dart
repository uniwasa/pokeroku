import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/provider/flavor_provider.dart';

final remoteConfigProvider = FutureProvider<RemoteConfig>((ref) async {
  final remoteConfig = RemoteConfig.instance;
  final flavor = ref.watch(flavorProvider);
  final interval =
      flavor == Flavor.prod ? const Duration(minutes: 12) : Duration.zero;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: interval,
  ));
  return remoteConfig;
});
