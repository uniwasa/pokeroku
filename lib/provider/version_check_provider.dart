import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pokeroku/provider/remote_config_provider.dart';
import 'package:pub_semver/pub_semver.dart';

final versionCheckProvider = FutureProvider<bool>((ref) async {
  final remoteConfig = await ref.watch(remoteConfigProvider.future);
  await remoteConfig.setDefaults(<String, dynamic>{
    'required_version': '1.0.0',
  });
  try {
    await remoteConfig.fetchAndActivate();
  } on Exception catch (e) {
    print(
        'Unable to fetch remote config. Cached or default values will be used');
  }
  final string = remoteConfig.getString('required_version');
  final packageInfo = await PackageInfo.fromPlatform();
  final requiredVersion = Version.parse(string);
  final currentVersion = Version.parse(packageInfo.version);
  final hasNewVersion = requiredVersion > currentVersion;
  return hasNewVersion;
});
