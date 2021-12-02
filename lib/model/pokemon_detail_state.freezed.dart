// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonDetailStateTearOff {
  const _$PokemonDetailStateTearOff();

  _PokemonDetailState call(
      {required Pokemon pokemonBase,
      required AsyncValue<PokemonEx> asyncPokemonEx,
      required AsyncValue<List<Move>> asyncMoves}) {
    return _PokemonDetailState(
      pokemonBase: pokemonBase,
      asyncPokemonEx: asyncPokemonEx,
      asyncMoves: asyncMoves,
    );
  }
}

/// @nodoc
const $PokemonDetailState = _$PokemonDetailStateTearOff();

/// @nodoc
mixin _$PokemonDetailState {
  Pokemon get pokemonBase => throw _privateConstructorUsedError;
  AsyncValue<PokemonEx> get asyncPokemonEx =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Move>> get asyncMoves => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDetailStateCopyWith<PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailStateCopyWith<$Res> {
  factory $PokemonDetailStateCopyWith(
          PokemonDetailState value, $Res Function(PokemonDetailState) then) =
      _$PokemonDetailStateCopyWithImpl<$Res>;
  $Res call(
      {Pokemon pokemonBase,
      AsyncValue<PokemonEx> asyncPokemonEx,
      AsyncValue<List<Move>> asyncMoves});

  $PokemonCopyWith<$Res> get pokemonBase;
  $AsyncValueCopyWith<PokemonEx, $Res> get asyncPokemonEx;
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoves;
}

/// @nodoc
class _$PokemonDetailStateCopyWithImpl<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  _$PokemonDetailStateCopyWithImpl(this._value, this._then);

  final PokemonDetailState _value;
  // ignore: unused_field
  final $Res Function(PokemonDetailState) _then;

  @override
  $Res call({
    Object? pokemonBase = freezed,
    Object? asyncPokemonEx = freezed,
    Object? asyncMoves = freezed,
  }) {
    return _then(_value.copyWith(
      pokemonBase: pokemonBase == freezed
          ? _value.pokemonBase
          : pokemonBase // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      asyncPokemonEx: asyncPokemonEx == freezed
          ? _value.asyncPokemonEx
          : asyncPokemonEx // ignore: cast_nullable_to_non_nullable
              as AsyncValue<PokemonEx>,
      asyncMoves: asyncMoves == freezed
          ? _value.asyncMoves
          : asyncMoves // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Move>>,
    ));
  }

  @override
  $PokemonCopyWith<$Res> get pokemonBase {
    return $PokemonCopyWith<$Res>(_value.pokemonBase, (value) {
      return _then(_value.copyWith(pokemonBase: value));
    });
  }

  @override
  $AsyncValueCopyWith<PokemonEx, $Res> get asyncPokemonEx {
    return $AsyncValueCopyWith<PokemonEx, $Res>(_value.asyncPokemonEx, (value) {
      return _then(_value.copyWith(asyncPokemonEx: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoves {
    return $AsyncValueCopyWith<List<Move>, $Res>(_value.asyncMoves, (value) {
      return _then(_value.copyWith(asyncMoves: value));
    });
  }
}

/// @nodoc
abstract class _$PokemonDetailStateCopyWith<$Res>
    implements $PokemonDetailStateCopyWith<$Res> {
  factory _$PokemonDetailStateCopyWith(
          _PokemonDetailState value, $Res Function(_PokemonDetailState) then) =
      __$PokemonDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Pokemon pokemonBase,
      AsyncValue<PokemonEx> asyncPokemonEx,
      AsyncValue<List<Move>> asyncMoves});

  @override
  $PokemonCopyWith<$Res> get pokemonBase;
  @override
  $AsyncValueCopyWith<PokemonEx, $Res> get asyncPokemonEx;
  @override
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoves;
}

/// @nodoc
class __$PokemonDetailStateCopyWithImpl<$Res>
    extends _$PokemonDetailStateCopyWithImpl<$Res>
    implements _$PokemonDetailStateCopyWith<$Res> {
  __$PokemonDetailStateCopyWithImpl(
      _PokemonDetailState _value, $Res Function(_PokemonDetailState) _then)
      : super(_value, (v) => _then(v as _PokemonDetailState));

  @override
  _PokemonDetailState get _value => super._value as _PokemonDetailState;

  @override
  $Res call({
    Object? pokemonBase = freezed,
    Object? asyncPokemonEx = freezed,
    Object? asyncMoves = freezed,
  }) {
    return _then(_PokemonDetailState(
      pokemonBase: pokemonBase == freezed
          ? _value.pokemonBase
          : pokemonBase // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      asyncPokemonEx: asyncPokemonEx == freezed
          ? _value.asyncPokemonEx
          : asyncPokemonEx // ignore: cast_nullable_to_non_nullable
              as AsyncValue<PokemonEx>,
      asyncMoves: asyncMoves == freezed
          ? _value.asyncMoves
          : asyncMoves // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Move>>,
    ));
  }
}

/// @nodoc

class _$_PokemonDetailState extends _PokemonDetailState
    with DiagnosticableTreeMixin {
  const _$_PokemonDetailState(
      {required this.pokemonBase,
      required this.asyncPokemonEx,
      required this.asyncMoves})
      : super._();

  @override
  final Pokemon pokemonBase;
  @override
  final AsyncValue<PokemonEx> asyncPokemonEx;
  @override
  final AsyncValue<List<Move>> asyncMoves;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonDetailState(pokemonBase: $pokemonBase, asyncPokemonEx: $asyncPokemonEx, asyncMoves: $asyncMoves)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonDetailState'))
      ..add(DiagnosticsProperty('pokemonBase', pokemonBase))
      ..add(DiagnosticsProperty('asyncPokemonEx', asyncPokemonEx))
      ..add(DiagnosticsProperty('asyncMoves', asyncMoves));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonDetailState &&
            (identical(other.pokemonBase, pokemonBase) ||
                const DeepCollectionEquality()
                    .equals(other.pokemonBase, pokemonBase)) &&
            (identical(other.asyncPokemonEx, asyncPokemonEx) ||
                const DeepCollectionEquality()
                    .equals(other.asyncPokemonEx, asyncPokemonEx)) &&
            (identical(other.asyncMoves, asyncMoves) ||
                const DeepCollectionEquality()
                    .equals(other.asyncMoves, asyncMoves)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pokemonBase) ^
      const DeepCollectionEquality().hash(asyncPokemonEx) ^
      const DeepCollectionEquality().hash(asyncMoves);

  @JsonKey(ignore: true)
  @override
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      __$PokemonDetailStateCopyWithImpl<_PokemonDetailState>(this, _$identity);
}

abstract class _PokemonDetailState extends PokemonDetailState {
  const factory _PokemonDetailState(
      {required Pokemon pokemonBase,
      required AsyncValue<PokemonEx> asyncPokemonEx,
      required AsyncValue<List<Move>> asyncMoves}) = _$_PokemonDetailState;
  const _PokemonDetailState._() : super._();

  @override
  Pokemon get pokemonBase => throw _privateConstructorUsedError;
  @override
  AsyncValue<PokemonEx> get asyncPokemonEx =>
      throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Move>> get asyncMoves => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
