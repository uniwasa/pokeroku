// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'build_edit_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BuildEditParameterTearOff {
  const _$BuildEditParameterTearOff();

  _BuildEditParameter call({required String? teamId, required String buildId}) {
    return _BuildEditParameter(
      teamId: teamId,
      buildId: buildId,
    );
  }
}

/// @nodoc
const $BuildEditParameter = _$BuildEditParameterTearOff();

/// @nodoc
mixin _$BuildEditParameter {
  String? get teamId => throw _privateConstructorUsedError;
  String get buildId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildEditParameterCopyWith<BuildEditParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildEditParameterCopyWith<$Res> {
  factory $BuildEditParameterCopyWith(
          BuildEditParameter value, $Res Function(BuildEditParameter) then) =
      _$BuildEditParameterCopyWithImpl<$Res>;
  $Res call({String? teamId, String buildId});
}

/// @nodoc
class _$BuildEditParameterCopyWithImpl<$Res>
    implements $BuildEditParameterCopyWith<$Res> {
  _$BuildEditParameterCopyWithImpl(this._value, this._then);

  final BuildEditParameter _value;
  // ignore: unused_field
  final $Res Function(BuildEditParameter) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? buildId = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$BuildEditParameterCopyWith<$Res>
    implements $BuildEditParameterCopyWith<$Res> {
  factory _$BuildEditParameterCopyWith(
          _BuildEditParameter value, $Res Function(_BuildEditParameter) then) =
      __$BuildEditParameterCopyWithImpl<$Res>;
  @override
  $Res call({String? teamId, String buildId});
}

/// @nodoc
class __$BuildEditParameterCopyWithImpl<$Res>
    extends _$BuildEditParameterCopyWithImpl<$Res>
    implements _$BuildEditParameterCopyWith<$Res> {
  __$BuildEditParameterCopyWithImpl(
      _BuildEditParameter _value, $Res Function(_BuildEditParameter) _then)
      : super(_value, (v) => _then(v as _BuildEditParameter));

  @override
  _BuildEditParameter get _value => super._value as _BuildEditParameter;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? buildId = freezed,
  }) {
    return _then(_BuildEditParameter(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String?,
      buildId: buildId == freezed
          ? _value.buildId
          : buildId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BuildEditParameter extends _BuildEditParameter
    with DiagnosticableTreeMixin {
  const _$_BuildEditParameter({required this.teamId, required this.buildId})
      : super._();

  @override
  final String? teamId;
  @override
  final String buildId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BuildEditParameter(teamId: $teamId, buildId: $buildId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BuildEditParameter'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('buildId', buildId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuildEditParameter &&
            (identical(other.teamId, teamId) ||
                const DeepCollectionEquality().equals(other.teamId, teamId)) &&
            (identical(other.buildId, buildId) ||
                const DeepCollectionEquality().equals(other.buildId, buildId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(teamId) ^
      const DeepCollectionEquality().hash(buildId);

  @JsonKey(ignore: true)
  @override
  _$BuildEditParameterCopyWith<_BuildEditParameter> get copyWith =>
      __$BuildEditParameterCopyWithImpl<_BuildEditParameter>(this, _$identity);
}

abstract class _BuildEditParameter extends BuildEditParameter {
  const factory _BuildEditParameter(
      {required String? teamId,
      required String buildId}) = _$_BuildEditParameter;
  const _BuildEditParameter._() : super._();

  @override
  String? get teamId => throw _privateConstructorUsedError;
  @override
  String get buildId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildEditParameterCopyWith<_BuildEditParameter> get copyWith =>
      throw _privateConstructorUsedError;
}
