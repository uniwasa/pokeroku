// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      {required List<Team> teams,
      required bool isLoading,
      required bool hasNext,
      String? error}) {
    return _TeamListState(
      teams: teams,
      isLoading: isLoading,
      hasNext: hasNext,
      error: error,
    );
  }
}

/// @nodoc
const $TeamListState = _$TeamListStateTearOff();

/// @nodoc
mixin _$TeamListState {
  List<Team> get teams => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamListStateCopyWith<TeamListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamListStateCopyWith<$Res> {
  factory $TeamListStateCopyWith(
          TeamListState value, $Res Function(TeamListState) then) =
      _$TeamListStateCopyWithImpl<$Res>;
  $Res call({List<Team> teams, bool isLoading, bool hasNext, String? error});
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
    Object? teams = freezed,
    Object? isLoading = freezed,
    Object? hasNext = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TeamListStateCopyWith<$Res>
    implements $TeamListStateCopyWith<$Res> {
  factory _$TeamListStateCopyWith(
          _TeamListState value, $Res Function(_TeamListState) then) =
      __$TeamListStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Team> teams, bool isLoading, bool hasNext, String? error});
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
    Object? teams = freezed,
    Object? isLoading = freezed,
    Object? hasNext = freezed,
    Object? error = freezed,
  }) {
    return _then(_TeamListState(
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNext: hasNext == freezed
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TeamListState extends _TeamListState with DiagnosticableTreeMixin {
  const _$_TeamListState(
      {required this.teams,
      required this.isLoading,
      required this.hasNext,
      this.error})
      : super._();

  @override
  final List<Team> teams;
  @override
  final bool isLoading;
  @override
  final bool hasNext;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamListState(teams: $teams, isLoading: $isLoading, hasNext: $hasNext, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamListState'))
      ..add(DiagnosticsProperty('teams', teams))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamListState &&
            const DeepCollectionEquality().equals(other.teams, teams) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasNext, hasNext) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teams),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasNext),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      __$TeamListStateCopyWithImpl<_TeamListState>(this, _$identity);
}

abstract class _TeamListState extends TeamListState {
  const factory _TeamListState(
      {required List<Team> teams,
      required bool isLoading,
      required bool hasNext,
      String? error}) = _$_TeamListState;
  const _TeamListState._() : super._();

  @override
  List<Team> get teams;
  @override
  bool get isLoading;
  @override
  bool get hasNext;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      throw _privateConstructorUsedError;
}
