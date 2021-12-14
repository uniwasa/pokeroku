// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'move_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoveDetailStateTearOff {
  const _$MoveDetailStateTearOff();

  _MoveDetailState call(
      {required Move move,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) {
    return _MoveDetailState(
      move: move,
      asyncPokemonList: asyncPokemonList,
    );
  }
}

/// @nodoc
const $MoveDetailState = _$MoveDetailStateTearOff();

/// @nodoc
mixin _$MoveDetailState {
  Move get move => throw _privateConstructorUsedError;
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoveDetailStateCopyWith<MoveDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveDetailStateCopyWith<$Res> {
  factory $MoveDetailStateCopyWith(
          MoveDetailState value, $Res Function(MoveDetailState) then) =
      _$MoveDetailStateCopyWithImpl<$Res>;
  $Res call({Move move, AsyncValue<List<Pokemon>> asyncPokemonList});

  $MoveCopyWith<$Res> get move;
}

/// @nodoc
class _$MoveDetailStateCopyWithImpl<$Res>
    implements $MoveDetailStateCopyWith<$Res> {
  _$MoveDetailStateCopyWithImpl(this._value, this._then);

  final MoveDetailState _value;
  // ignore: unused_field
  final $Res Function(MoveDetailState) _then;

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
}

/// @nodoc
abstract class _$MoveDetailStateCopyWith<$Res>
    implements $MoveDetailStateCopyWith<$Res> {
  factory _$MoveDetailStateCopyWith(
          _MoveDetailState value, $Res Function(_MoveDetailState) then) =
      __$MoveDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({Move move, AsyncValue<List<Pokemon>> asyncPokemonList});

  @override
  $MoveCopyWith<$Res> get move;
}

/// @nodoc
class __$MoveDetailStateCopyWithImpl<$Res>
    extends _$MoveDetailStateCopyWithImpl<$Res>
    implements _$MoveDetailStateCopyWith<$Res> {
  __$MoveDetailStateCopyWithImpl(
      _MoveDetailState _value, $Res Function(_MoveDetailState) _then)
      : super(_value, (v) => _then(v as _MoveDetailState));

  @override
  _MoveDetailState get _value => super._value as _MoveDetailState;

  @override
  $Res call({
    Object? move = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_MoveDetailState(
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

class _$_MoveDetailState extends _MoveDetailState with DiagnosticableTreeMixin {
  const _$_MoveDetailState({required this.move, required this.asyncPokemonList})
      : super._();

  @override
  final Move move;
  @override
  final AsyncValue<List<Pokemon>> asyncPokemonList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveDetailState(move: $move, asyncPokemonList: $asyncPokemonList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoveDetailState'))
      ..add(DiagnosticsProperty('move', move))
      ..add(DiagnosticsProperty('asyncPokemonList', asyncPokemonList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoveDetailState &&
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
  _$MoveDetailStateCopyWith<_MoveDetailState> get copyWith =>
      __$MoveDetailStateCopyWithImpl<_MoveDetailState>(this, _$identity);
}

abstract class _MoveDetailState extends MoveDetailState {
  const factory _MoveDetailState(
          {required Move move,
          required AsyncValue<List<Pokemon>> asyncPokemonList}) =
      _$_MoveDetailState;
  const _MoveDetailState._() : super._();

  @override
  Move get move => throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MoveDetailStateCopyWith<_MoveDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
