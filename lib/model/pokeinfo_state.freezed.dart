// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokeinfo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokeinfoStateTearOff {
  const _$PokeinfoStateTearOff();

  _PokeinfoState call(
      {required Pokemon pokemonBase,
      required AsyncValue<PokemonEx> asyncPokemonEx,
      required AsyncValue<List<Move>> asyncMoves}) {
    return _PokeinfoState(
      pokemonBase: pokemonBase,
      asyncPokemonEx: asyncPokemonEx,
      asyncMoves: asyncMoves,
    );
  }
}

/// @nodoc
const $PokeinfoState = _$PokeinfoStateTearOff();

/// @nodoc
mixin _$PokeinfoState {
  Pokemon get pokemonBase => throw _privateConstructorUsedError;
  AsyncValue<PokemonEx> get asyncPokemonEx =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Move>> get asyncMoves => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokeinfoStateCopyWith<PokeinfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeinfoStateCopyWith<$Res> {
  factory $PokeinfoStateCopyWith(
          PokeinfoState value, $Res Function(PokeinfoState) then) =
      _$PokeinfoStateCopyWithImpl<$Res>;
  $Res call(
      {Pokemon pokemonBase,
      AsyncValue<PokemonEx> asyncPokemonEx,
      AsyncValue<List<Move>> asyncMoves});

  $PokemonCopyWith<$Res> get pokemonBase;
  $AsyncValueCopyWith<PokemonEx, $Res> get asyncPokemonEx;
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoves;
}

/// @nodoc
class _$PokeinfoStateCopyWithImpl<$Res>
    implements $PokeinfoStateCopyWith<$Res> {
  _$PokeinfoStateCopyWithImpl(this._value, this._then);

  final PokeinfoState _value;
  // ignore: unused_field
  final $Res Function(PokeinfoState) _then;

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
abstract class _$PokeinfoStateCopyWith<$Res>
    implements $PokeinfoStateCopyWith<$Res> {
  factory _$PokeinfoStateCopyWith(
          _PokeinfoState value, $Res Function(_PokeinfoState) then) =
      __$PokeinfoStateCopyWithImpl<$Res>;
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
class __$PokeinfoStateCopyWithImpl<$Res>
    extends _$PokeinfoStateCopyWithImpl<$Res>
    implements _$PokeinfoStateCopyWith<$Res> {
  __$PokeinfoStateCopyWithImpl(
      _PokeinfoState _value, $Res Function(_PokeinfoState) _then)
      : super(_value, (v) => _then(v as _PokeinfoState));

  @override
  _PokeinfoState get _value => super._value as _PokeinfoState;

  @override
  $Res call({
    Object? pokemonBase = freezed,
    Object? asyncPokemonEx = freezed,
    Object? asyncMoves = freezed,
  }) {
    return _then(_PokeinfoState(
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

class _$_PokeinfoState extends _PokeinfoState with DiagnosticableTreeMixin {
  const _$_PokeinfoState(
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
    return 'PokeinfoState(pokemonBase: $pokemonBase, asyncPokemonEx: $asyncPokemonEx, asyncMoves: $asyncMoves)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeinfoState'))
      ..add(DiagnosticsProperty('pokemonBase', pokemonBase))
      ..add(DiagnosticsProperty('asyncPokemonEx', asyncPokemonEx))
      ..add(DiagnosticsProperty('asyncMoves', asyncMoves));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokeinfoState &&
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
  _$PokeinfoStateCopyWith<_PokeinfoState> get copyWith =>
      __$PokeinfoStateCopyWithImpl<_PokeinfoState>(this, _$identity);
}

abstract class _PokeinfoState extends PokeinfoState {
  const factory _PokeinfoState(
      {required Pokemon pokemonBase,
      required AsyncValue<PokemonEx> asyncPokemonEx,
      required AsyncValue<List<Move>> asyncMoves}) = _$_PokeinfoState;
  const _PokeinfoState._() : super._();

  @override
  Pokemon get pokemonBase => throw _privateConstructorUsedError;
  @override
  AsyncValue<PokemonEx> get asyncPokemonEx =>
      throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Move>> get asyncMoves => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokeinfoStateCopyWith<_PokeinfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
