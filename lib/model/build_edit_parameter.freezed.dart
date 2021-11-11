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

  _BuildEditParameter call(
      {required Build build, required BuildManager buildManager}) {
    return _BuildEditParameter(
      build: build,
      buildManager: buildManager,
    );
  }
}

/// @nodoc
const $BuildEditParameter = _$BuildEditParameterTearOff();

/// @nodoc
mixin _$BuildEditParameter {
  Build get build => throw _privateConstructorUsedError;
  BuildManager get buildManager => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildEditParameterCopyWith<BuildEditParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildEditParameterCopyWith<$Res> {
  factory $BuildEditParameterCopyWith(
          BuildEditParameter value, $Res Function(BuildEditParameter) then) =
      _$BuildEditParameterCopyWithImpl<$Res>;
  $Res call({Build build, BuildManager buildManager});

  $BuildCopyWith<$Res> get build;
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
    Object? build = freezed,
    Object? buildManager = freezed,
  }) {
    return _then(_value.copyWith(
      build: build == freezed
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as Build,
      buildManager: buildManager == freezed
          ? _value.buildManager
          : buildManager // ignore: cast_nullable_to_non_nullable
              as BuildManager,
    ));
  }

  @override
  $BuildCopyWith<$Res> get build {
    return $BuildCopyWith<$Res>(_value.build, (value) {
      return _then(_value.copyWith(build: value));
    });
  }
}

/// @nodoc
abstract class _$BuildEditParameterCopyWith<$Res>
    implements $BuildEditParameterCopyWith<$Res> {
  factory _$BuildEditParameterCopyWith(
          _BuildEditParameter value, $Res Function(_BuildEditParameter) then) =
      __$BuildEditParameterCopyWithImpl<$Res>;
  @override
  $Res call({Build build, BuildManager buildManager});

  @override
  $BuildCopyWith<$Res> get build;
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
    Object? build = freezed,
    Object? buildManager = freezed,
  }) {
    return _then(_BuildEditParameter(
      build: build == freezed
          ? _value.build
          : build // ignore: cast_nullable_to_non_nullable
              as Build,
      buildManager: buildManager == freezed
          ? _value.buildManager
          : buildManager // ignore: cast_nullable_to_non_nullable
              as BuildManager,
    ));
  }
}

/// @nodoc

class _$_BuildEditParameter extends _BuildEditParameter
    with DiagnosticableTreeMixin {
  const _$_BuildEditParameter({required this.build, required this.buildManager})
      : super._();

  @override
  final Build build;
  @override
  final BuildManager buildManager;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BuildEditParameter(build: $build, buildManager: $buildManager)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BuildEditParameter'))
      ..add(DiagnosticsProperty('build', build))
      ..add(DiagnosticsProperty('buildManager', buildManager));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuildEditParameter &&
            (identical(other.build, build) ||
                const DeepCollectionEquality().equals(other.build, build)) &&
            (identical(other.buildManager, buildManager) ||
                const DeepCollectionEquality()
                    .equals(other.buildManager, buildManager)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(build) ^
      const DeepCollectionEquality().hash(buildManager);

  @JsonKey(ignore: true)
  @override
  _$BuildEditParameterCopyWith<_BuildEditParameter> get copyWith =>
      __$BuildEditParameterCopyWithImpl<_BuildEditParameter>(this, _$identity);
}

abstract class _BuildEditParameter extends BuildEditParameter {
  const factory _BuildEditParameter(
      {required Build build,
      required BuildManager buildManager}) = _$_BuildEditParameter;
  const _BuildEditParameter._() : super._();

  @override
  Build get build => throw _privateConstructorUsedError;
  @override
  BuildManager get buildManager => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildEditParameterCopyWith<_BuildEditParameter> get copyWith =>
      throw _privateConstructorUsedError;
}
