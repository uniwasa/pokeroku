// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'move_selection_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoveSelectionParamTearOff {
  const _$MoveSelectionParamTearOff();

  _MoveSelectionParam call(
      {required int moveIndex, required BuildEditParam buildEditParam}) {
    return _MoveSelectionParam(
      moveIndex: moveIndex,
      buildEditParam: buildEditParam,
    );
  }
}

/// @nodoc
const $MoveSelectionParam = _$MoveSelectionParamTearOff();

/// @nodoc
mixin _$MoveSelectionParam {
  int get moveIndex => throw _privateConstructorUsedError;
  BuildEditParam get buildEditParam => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoveSelectionParamCopyWith<MoveSelectionParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveSelectionParamCopyWith<$Res> {
  factory $MoveSelectionParamCopyWith(
          MoveSelectionParam value, $Res Function(MoveSelectionParam) then) =
      _$MoveSelectionParamCopyWithImpl<$Res>;
  $Res call({int moveIndex, BuildEditParam buildEditParam});

  $BuildEditParamCopyWith<$Res> get buildEditParam;
}

/// @nodoc
class _$MoveSelectionParamCopyWithImpl<$Res>
    implements $MoveSelectionParamCopyWith<$Res> {
  _$MoveSelectionParamCopyWithImpl(this._value, this._then);

  final MoveSelectionParam _value;
  // ignore: unused_field
  final $Res Function(MoveSelectionParam) _then;

  @override
  $Res call({
    Object? moveIndex = freezed,
    Object? buildEditParam = freezed,
  }) {
    return _then(_value.copyWith(
      moveIndex: moveIndex == freezed
          ? _value.moveIndex
          : moveIndex // ignore: cast_nullable_to_non_nullable
              as int,
      buildEditParam: buildEditParam == freezed
          ? _value.buildEditParam
          : buildEditParam // ignore: cast_nullable_to_non_nullable
              as BuildEditParam,
    ));
  }

  @override
  $BuildEditParamCopyWith<$Res> get buildEditParam {
    return $BuildEditParamCopyWith<$Res>(_value.buildEditParam, (value) {
      return _then(_value.copyWith(buildEditParam: value));
    });
  }
}

/// @nodoc
abstract class _$MoveSelectionParamCopyWith<$Res>
    implements $MoveSelectionParamCopyWith<$Res> {
  factory _$MoveSelectionParamCopyWith(
          _MoveSelectionParam value, $Res Function(_MoveSelectionParam) then) =
      __$MoveSelectionParamCopyWithImpl<$Res>;
  @override
  $Res call({int moveIndex, BuildEditParam buildEditParam});

  @override
  $BuildEditParamCopyWith<$Res> get buildEditParam;
}

/// @nodoc
class __$MoveSelectionParamCopyWithImpl<$Res>
    extends _$MoveSelectionParamCopyWithImpl<$Res>
    implements _$MoveSelectionParamCopyWith<$Res> {
  __$MoveSelectionParamCopyWithImpl(
      _MoveSelectionParam _value, $Res Function(_MoveSelectionParam) _then)
      : super(_value, (v) => _then(v as _MoveSelectionParam));

  @override
  _MoveSelectionParam get _value => super._value as _MoveSelectionParam;

  @override
  $Res call({
    Object? moveIndex = freezed,
    Object? buildEditParam = freezed,
  }) {
    return _then(_MoveSelectionParam(
      moveIndex: moveIndex == freezed
          ? _value.moveIndex
          : moveIndex // ignore: cast_nullable_to_non_nullable
              as int,
      buildEditParam: buildEditParam == freezed
          ? _value.buildEditParam
          : buildEditParam // ignore: cast_nullable_to_non_nullable
              as BuildEditParam,
    ));
  }
}

/// @nodoc

class _$_MoveSelectionParam extends _MoveSelectionParam
    with DiagnosticableTreeMixin {
  const _$_MoveSelectionParam(
      {required this.moveIndex, required this.buildEditParam})
      : super._();

  @override
  final int moveIndex;
  @override
  final BuildEditParam buildEditParam;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveSelectionParam(moveIndex: $moveIndex, buildEditParam: $buildEditParam)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoveSelectionParam'))
      ..add(DiagnosticsProperty('moveIndex', moveIndex))
      ..add(DiagnosticsProperty('buildEditParam', buildEditParam));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoveSelectionParam &&
            (identical(other.moveIndex, moveIndex) ||
                const DeepCollectionEquality()
                    .equals(other.moveIndex, moveIndex)) &&
            (identical(other.buildEditParam, buildEditParam) ||
                const DeepCollectionEquality()
                    .equals(other.buildEditParam, buildEditParam)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(moveIndex) ^
      const DeepCollectionEquality().hash(buildEditParam);

  @JsonKey(ignore: true)
  @override
  _$MoveSelectionParamCopyWith<_MoveSelectionParam> get copyWith =>
      __$MoveSelectionParamCopyWithImpl<_MoveSelectionParam>(this, _$identity);
}

abstract class _MoveSelectionParam extends MoveSelectionParam {
  const factory _MoveSelectionParam(
      {required int moveIndex,
      required BuildEditParam buildEditParam}) = _$_MoveSelectionParam;
  const _MoveSelectionParam._() : super._();

  @override
  int get moveIndex => throw _privateConstructorUsedError;
  @override
  BuildEditParam get buildEditParam => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MoveSelectionParamCopyWith<_MoveSelectionParam> get copyWith =>
      throw _privateConstructorUsedError;
}
