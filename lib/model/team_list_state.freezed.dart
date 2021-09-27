// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'team_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TeamListStateTearOff {
  const _$TeamListStateTearOff();

  _TeamListState call(
      {required AsyncValue<String> asyncText, required User? user}) {
    return _TeamListState(
      asyncText: asyncText,
      user: user,
    );
  }
}

/// @nodoc
const $TeamListState = _$TeamListStateTearOff();

/// @nodoc
mixin _$TeamListState {
  AsyncValue<String> get asyncText => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamListStateCopyWith<TeamListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamListStateCopyWith<$Res> {
  factory $TeamListStateCopyWith(
          TeamListState value, $Res Function(TeamListState) then) =
      _$TeamListStateCopyWithImpl<$Res>;
  $Res call({AsyncValue<String> asyncText, User? user});

  $AsyncValueCopyWith<String, $Res> get asyncText;
}

/// @nodoc
class _$TeamListStateCopyWithImpl<$Res>
    implements $TeamListStateCopyWith<$Res> {
  _$TeamListStateCopyWithImpl(this._value, this._then);

  final TeamListState _value;
  // ignore: unused_field
  final $Res Function(TeamListState) _then;

  @override
  $Res call({
    Object? asyncText = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      asyncText: asyncText == freezed
          ? _value.asyncText
          : asyncText // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $AsyncValueCopyWith<String, $Res> get asyncText {
    return $AsyncValueCopyWith<String, $Res>(_value.asyncText, (value) {
      return _then(_value.copyWith(asyncText: value));
    });
  }
}

/// @nodoc
abstract class _$TeamListStateCopyWith<$Res>
    implements $TeamListStateCopyWith<$Res> {
  factory _$TeamListStateCopyWith(
          _TeamListState value, $Res Function(_TeamListState) then) =
      __$TeamListStateCopyWithImpl<$Res>;
  @override
  $Res call({AsyncValue<String> asyncText, User? user});

  @override
  $AsyncValueCopyWith<String, $Res> get asyncText;
}

/// @nodoc
class __$TeamListStateCopyWithImpl<$Res>
    extends _$TeamListStateCopyWithImpl<$Res>
    implements _$TeamListStateCopyWith<$Res> {
  __$TeamListStateCopyWithImpl(
      _TeamListState _value, $Res Function(_TeamListState) _then)
      : super(_value, (v) => _then(v as _TeamListState));

  @override
  _TeamListState get _value => super._value as _TeamListState;

  @override
  $Res call({
    Object? asyncText = freezed,
    Object? user = freezed,
  }) {
    return _then(_TeamListState(
      asyncText: asyncText == freezed
          ? _value.asyncText
          : asyncText // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_TeamListState extends _TeamListState with DiagnosticableTreeMixin {
  const _$_TeamListState({required this.asyncText, required this.user})
      : super._();

  @override
  final AsyncValue<String> asyncText;
  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamListState(asyncText: $asyncText, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamListState'))
      ..add(DiagnosticsProperty('asyncText', asyncText))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamListState &&
            (identical(other.asyncText, asyncText) ||
                const DeepCollectionEquality()
                    .equals(other.asyncText, asyncText)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(asyncText) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      __$TeamListStateCopyWithImpl<_TeamListState>(this, _$identity);
}

abstract class _TeamListState extends TeamListState {
  const factory _TeamListState(
      {required AsyncValue<String> asyncText,
      required User? user}) = _$_TeamListState;
  const _TeamListState._() : super._();

  @override
  AsyncValue<String> get asyncText => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      throw _privateConstructorUsedError;
}
