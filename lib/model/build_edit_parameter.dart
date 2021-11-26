import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:pokeroku/interface/build_manager.dart';
import 'package:pokeroku/model/build.dart';

part 'build_edit_parameter.freezed.dart';

@freezed
class BuildEditParameter with _$BuildEditParameter {
  const BuildEditParameter._();

  const factory BuildEditParameter({
    required String? teamId,
    required String buildId,
  }) = _BuildEditParameter;
}
