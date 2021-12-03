// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'team_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TeamEditStateTearOff {
  const _$TeamEditStateTearOff();

  _TeamEditState call({required Team team, required bool isAddable}) {
    return _TeamEditState(
      team: team,
      isAddable: isAddable,
    );
  }
}

/// @nodoc
const $TeamEditState = _$TeamEditStateTearOff();

/// @nodoc
mixin _$TeamEditState {
  Team get team => throw _privateConstructorUsedError;
  bool get isAddable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamEditStateCopyWith<TeamEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamEditStateCopyWith<$Res> {
  factory $TeamEditStateCopyWith(
          TeamEditState value, $Res Function(TeamEditState) then) =
      _$TeamEditStateCopyWithImpl<$Res>;
  $Res call({Team team, bool isAddable});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$TeamEditStateCopyWithImpl<$Res>
    implements $TeamEditStateCopyWith<$Res> {
  _$TeamEditStateCopyWithImpl(this._value, this._then);

  final TeamEditState _value;
  // ignore: unused_field
  final $Res Function(TeamEditState) _then;

  @override
  $Res call({
    Object? team = freezed,
    Object? isAddable = freezed,
  }) {
    return _then(_value.copyWith(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      isAddable: isAddable == freezed
          ? _value.isAddable
          : isAddable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc
abstract class _$TeamEditStateCopyWith<$Res>
    implements $TeamEditStateCopyWith<$Res> {
  factory _$TeamEditStateCopyWith(
          _TeamEditState value, $Res Function(_TeamEditState) then) =
      __$TeamEditStateCopyWithImpl<$Res>;
  @override
  $Res call({Team team, bool isAddable});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$TeamEditStateCopyWithImpl<$Res>
    extends _$TeamEditStateCopyWithImpl<$Res>
    implements _$TeamEditStateCopyWith<$Res> {
  __$TeamEditStateCopyWithImpl(
      _TeamEditState _value, $Res Function(_TeamEditState) _then)
      : super(_value, (v) => _then(v as _TeamEditState));

  @override
  _TeamEditState get _value => super._value as _TeamEditState;

  @override
  $Res call({
    Object? team = freezed,
    Object? isAddable = freezed,
  }) {
    return _then(_TeamEditState(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
      isAddable: isAddable == freezed
          ? _value.isAddable
          : isAddable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TeamEditState extends _TeamEditState with DiagnosticableTreeMixin {
  const _$_TeamEditState({required this.team, required this.isAddable})
      : super._();

  @override
  final Team team;
  @override
  final bool isAddable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEditState(team: $team, isAddable: $isAddable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEditState'))
      ..add(DiagnosticsProperty('team', team))
      ..add(DiagnosticsProperty('isAddable', isAddable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TeamEditState &&
            (identical(other.team, team) ||
                const DeepCollectionEquality().equals(other.team, team)) &&
            (identical(other.isAddable, isAddable) ||
                const DeepCollectionEquality()
                    .equals(other.isAddable, isAddable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(team) ^
      const DeepCollectionEquality().hash(isAddable);

  @JsonKey(ignore: true)
  @override
  _$TeamEditStateCopyWith<_TeamEditState> get copyWith =>
      __$TeamEditStateCopyWithImpl<_TeamEditState>(this, _$identity);
}

abstract class _TeamEditState extends TeamEditState {
  const factory _TeamEditState({required Team team, required bool isAddable}) =
      _$_TeamEditState;
  const _TeamEditState._() : super._();

  @override
  Team get team => throw _privateConstructorUsedError;
  @override
  bool get isAddable => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TeamEditStateCopyWith<_TeamEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
