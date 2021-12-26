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
      {required AsyncValue<List<Team>> teamList,
      required bool isFetching,
      required bool hasNext,
      String? error}) {
    return _TeamListState(
      teamList: teamList,
      isFetching: isFetching,
      hasNext: hasNext,
      error: error,
    );
  }
}

/// @nodoc
const $TeamListState = _$TeamListStateTearOff();

/// @nodoc
mixin _$TeamListState {
  AsyncValue<List<Team>> get teamList => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
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
  $Res call(
      {AsyncValue<List<Team>> teamList,
      bool isFetching,
      bool hasNext,
      String? error});
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
    Object? teamList = freezed,
    Object? isFetching = freezed,
    Object? hasNext = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      teamList: teamList == freezed
          ? _value.teamList
          : teamList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Team>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {AsyncValue<List<Team>> teamList,
      bool isFetching,
      bool hasNext,
      String? error});
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
    Object? teamList = freezed,
    Object? isFetching = freezed,
    Object? hasNext = freezed,
    Object? error = freezed,
  }) {
    return _then(_TeamListState(
      teamList: teamList == freezed
          ? _value.teamList
          : teamList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Team>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
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
      {required this.teamList,
      required this.isFetching,
      required this.hasNext,
      this.error})
      : super._();

  @override
  final AsyncValue<List<Team>> teamList;
  @override
  final bool isFetching;
  @override
  final bool hasNext;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamListState(teamList: $teamList, isFetching: $isFetching, hasNext: $hasNext, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamListState'))
      ..add(DiagnosticsProperty('teamList', teamList))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TeamListState &&
            const DeepCollectionEquality().equals(other.teamList, teamList) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality().equals(other.hasNext, hasNext) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamList),
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(hasNext),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      __$TeamListStateCopyWithImpl<_TeamListState>(this, _$identity);
}

abstract class _TeamListState extends TeamListState {
  const factory _TeamListState(
      {required AsyncValue<List<Team>> teamList,
      required bool isFetching,
      required bool hasNext,
      String? error}) = _$_TeamListState;
  const _TeamListState._() : super._();

  @override
  AsyncValue<List<Team>> get teamList;
  @override
  bool get isFetching;
  @override
  bool get hasNext;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$TeamListStateCopyWith<_TeamListState> get copyWith =>
      throw _privateConstructorUsedError;
}
