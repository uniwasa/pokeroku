import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'build_edit_param.freezed.dart';

@freezed
class BuildEditParam with _$BuildEditParam {
  const BuildEditParam._();

  const factory BuildEditParam({
    required String? teamId,
    required String buildId,
    required int pokemonId,
  }) = _BuildEditParam;
}
