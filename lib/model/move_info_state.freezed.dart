// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'move_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoveInfoStateTearOff {
  const _$MoveInfoStateTearOff();

  _MoveInfoState call(
      {required Move move,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) {
    return _MoveInfoState(
      move: move,
      asyncPokemonList: asyncPokemonList,
    );
  }
}

/// @nodoc
const $MoveInfoState = _$MoveInfoStateTearOff();

/// @nodoc
mixin _$MoveInfoState {
  Move get move => throw _privateConstructorUsedError;
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoveInfoStateCopyWith<MoveInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveInfoStateCopyWith<$Res> {
  factory $MoveInfoStateCopyWith(
          MoveInfoState value, $Res Function(MoveInfoState) then) =
      _$MoveInfoStateCopyWithImpl<$Res>;
  $Res call({Move move, AsyncValue<List<Pokemon>> asyncPokemonList});

  $MoveCopyWith<$Res> get move;
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList;
}

/// @nodoc
class _$MoveInfoStateCopyWithImpl<$Res>
    implements $MoveInfoStateCopyWith<$Res> {
  _$MoveInfoStateCopyWithImpl(this._value, this._then);

  final MoveInfoState _value;
  // ignore: unused_field
  final $Res Function(MoveInfoState) _then;

  @override
  $Res call({
    Object? move = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_value.copyWith(
      move: move == freezed
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as Move,
      asyncPokemonList: asyncPokemonList == freezed
          ? _value.asyncPokemonList
          : asyncPokemonList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Pokemon>>,
    ));
  }

  @override
  $MoveCopyWith<$Res> get move {
    return $MoveCopyWith<$Res>(_value.move, (value) {
      return _then(_value.copyWith(move: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList {
    return $AsyncValueCopyWith<List<Pokemon>, $Res>(_value.asyncPokemonList,
        (value) {
      return _then(_value.copyWith(asyncPokemonList: value));
    });
  }
}

/// @nodoc
abstract class _$MoveInfoStateCopyWith<$Res>
    implements $MoveInfoStateCopyWith<$Res> {
  factory _$MoveInfoStateCopyWith(
          _MoveInfoState value, $Res Function(_MoveInfoState) then) =
      __$MoveInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({Move move, AsyncValue<List<Pokemon>> asyncPokemonList});

  @override
  $MoveCopyWith<$Res> get move;
  @override
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList;
}

/// @nodoc
class __$MoveInfoStateCopyWithImpl<$Res>
    extends _$MoveInfoStateCopyWithImpl<$Res>
    implements _$MoveInfoStateCopyWith<$Res> {
  __$MoveInfoStateCopyWithImpl(
      _MoveInfoState _value, $Res Function(_MoveInfoState) _then)
      : super(_value, (v) => _then(v as _MoveInfoState));

  @override
  _MoveInfoState get _value => super._value as _MoveInfoState;

  @override
  $Res call({
    Object? move = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_MoveInfoState(
      move: move == freezed
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as Move,
      asyncPokemonList: asyncPokemonList == freezed
          ? _value.asyncPokemonList
          : asyncPokemonList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Pokemon>>,
    ));
  }
}

/// @nodoc

class _$_MoveInfoState extends _MoveInfoState with DiagnosticableTreeMixin {
  const _$_MoveInfoState({required this.move, required this.asyncPokemonList})
      : super._();

  @override
  final Move move;
  @override
  final AsyncValue<List<Pokemon>> asyncPokemonList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveInfoState(move: $move, asyncPokemonList: $asyncPokemonList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoveInfoState'))
      ..add(DiagnosticsProperty('move', move))
      ..add(DiagnosticsProperty('asyncPokemonList', asyncPokemonList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoveInfoState &&
            (identical(other.move, move) ||
                const DeepCollectionEquality().equals(other.move, move)) &&
            (identical(other.asyncPokemonList, asyncPokemonList) ||
                const DeepCollectionEquality()
                    .equals(other.asyncPokemonList, asyncPokemonList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(move) ^
      const DeepCollectionEquality().hash(asyncPokemonList);

  @JsonKey(ignore: true)
  @override
  _$MoveInfoStateCopyWith<_MoveInfoState> get copyWith =>
      __$MoveInfoStateCopyWithImpl<_MoveInfoState>(this, _$identity);
}

abstract class _MoveInfoState extends MoveInfoState {
  const factory _MoveInfoState(
      {required Move move,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) = _$_MoveInfoState;
  const _MoveInfoState._() : super._();

  @override
  Move get move => throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MoveInfoStateCopyWith<_MoveInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
