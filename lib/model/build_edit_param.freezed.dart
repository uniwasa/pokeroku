// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'build_edit_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BuildEditParamTearOff {
  const _$BuildEditParamTearOff();

  _BuildEditParam call(
      {required String? teamId,
      required String buildId,
      required int pokemonId}) {
    return _BuildEditParam(
      teamId: teamId,
      buildId: buildId,
      pokemonId: pokemonId,
    );
  }
}

/// @nodoc
const $BuildEditParam = _$BuildEditParamTearOff();

/// @nodoc
mixin _$BuildEditParam {
  String? get teamId => throw _privateConstructorUsedError;
  String get buildId => throw _privateConstructorUsedError;
  int get pokemonId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildEditParamCopyWith<BuildEditParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildEditParamCopyWith<$Res> {
  factory $BuildEditParamCopyWith(
          BuildEditParam value, $Res Function(BuildEditParam) then) =
      _$BuildEditParamCopyWithImpl<$Res>;
  $Res call({String? teamId, String buildId, int pokemonId});
}

/// @nodoc
class _$BuildEditParamCopyWithImpl<$Res>
    implements $BuildEditParamCopyWith<$Res> {
  _$BuildEditParamCopyWithImpl(this._value, this._then);

  final BuildEditParam _value;
  // ignore: unused_field
  final $Res Function(BuildEditParam) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? buildId = freezed,
    Object? pokemonId = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      buildId: buildId == freezed
          ? _value.buildId
          : buildId // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonId: pokemonId == freezed
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BuildEditParamCopyWith<$Res>
    implements $BuildEditParamCopyWith<$Res> {
  factory _$BuildEditParamCopyWith(
          _BuildEditParam value, $Res Function(_BuildEditParam) then) =
      __$BuildEditParamCopyWithImpl<$Res>;
  @override
  $Res call({String? teamId, String buildId, int pokemonId});
}

/// @nodoc
class __$BuildEditParamCopyWithImpl<$Res>
    extends _$BuildEditParamCopyWithImpl<$Res>
    implements _$BuildEditParamCopyWith<$Res> {
  __$BuildEditParamCopyWithImpl(
      _BuildEditParam _value, $Res Function(_BuildEditParam) _then)
      : super(_value, (v) => _then(v as _BuildEditParam));

  @override
  _BuildEditParam get _value => super._value as _BuildEditParam;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? buildId = freezed,
    Object? pokemonId = freezed,
  }) {
    return _then(_BuildEditParam(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      buildId: buildId == freezed
          ? _value.buildId
          : buildId // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonId: pokemonId == freezed
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BuildEditParam extends _BuildEditParam with DiagnosticableTreeMixin {
  const _$_BuildEditParam(
      {required this.teamId, required this.buildId, required this.pokemonId})
      : super._();

  @override
  final String? teamId;
  @override
  final String buildId;
  @override
  final int pokemonId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BuildEditParam(teamId: $teamId, buildId: $buildId, pokemonId: $pokemonId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BuildEditParam'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('buildId', buildId))
      ..add(DiagnosticsProperty('pokemonId', pokemonId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuildEditParam &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.buildId, buildId) &&
            const DeepCollectionEquality().equals(other.pokemonId, pokemonId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(buildId),
      const DeepCollectionEquality().hash(pokemonId));

  @JsonKey(ignore: true)
  @override
  _$BuildEditParamCopyWith<_BuildEditParam> get copyWith =>
      __$BuildEditParamCopyWithImpl<_BuildEditParam>(this, _$identity);
}

abstract class _BuildEditParam extends BuildEditParam {
  const factory _BuildEditParam(
      {required String? teamId,
      required String buildId,
      required int pokemonId}) = _$_BuildEditParam;
  const _BuildEditParam._() : super._();

  @override
  String? get teamId;
  @override
  String get buildId;
  @override
  int get pokemonId;
  @override
  @JsonKey(ignore: true)
  _$BuildEditParamCopyWith<_BuildEditParam> get copyWith =>
      throw _privateConstructorUsedError;
}
