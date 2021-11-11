import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/build.dart';
import 'package:pokeroku/model/build_edit_parameter.dart';
import 'package:pokeroku/ui/build_edit/build_edit_view_model.dart';

class BuildEditPage extends HookWidget {
  BuildEditPage({Key? key, required BuildEditParameter buildEditParameter})
      : _build = buildEditParameter.build,
        _buildManager = buildEditParameter.buildManager,
        super(key: key);

  final Build _build;
  final BuildManager _buildManager;

  @override
  Widget build(BuildContext context) {
    final currentBuild = useProvider(buildEditViewModelProviderFamily(
        BuildEditParameter(build: _build, buildManager: _buildManager)));
    return Scaffold(
      appBar: AppBar(
        title: Text('ポケモン編集'),
      ),
      body: Text('hello'),
    );
  }
}
