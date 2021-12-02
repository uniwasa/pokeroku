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
      {required Pokemon pokemon,
      required AsyncValue<List<Move>> asyncMoveList,
      required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
      required AsyncValue<List<Ability>> asyncAbilityList,
      required AsyncValue<List<List<Pokemon>>> asyncEvolutionLine}) {
    return _PokemonDetailState(
      pokemon: pokemon,
      asyncMoveList: asyncMoveList,
      asyncPokemonFlavorTextList: asyncPokemonFlavorTextList,
      asyncAbilityList: asyncAbilityList,
      asyncEvolutionLine: asyncEvolutionLine,
    );
  }
}

/// @nodoc
const $PokemonDetailState = _$PokemonDetailStateTearOff();

/// @nodoc
mixin _$PokemonDetailState {
  Pokemon get pokemon => throw _privateConstructorUsedError;
  AsyncValue<List<Move>> get asyncMoveList =>
      throw _privateConstructorUsedError;
  AsyncValue<List<PokemonFlavorText>> get asyncPokemonFlavorTextList =>
      throw _privateConstructorUsedError;
  AsyncValue<List<Ability>> get asyncAbilityList =>
      throw _privateConstructorUsedError;
  AsyncValue<List<List<Pokemon>>> get asyncEvolutionLine =>
      throw _privateConstructorUsedError;

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
      {Pokemon pokemon,
      AsyncValue<List<Move>> asyncMoveList,
      AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
      AsyncValue<List<Ability>> asyncAbilityList,
      AsyncValue<List<List<Pokemon>>> asyncEvolutionLine});

  $PokemonCopyWith<$Res> get pokemon;
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoveList;
  $AsyncValueCopyWith<List<PokemonFlavorText>, $Res>
      get asyncPokemonFlavorTextList;
  $AsyncValueCopyWith<List<Ability>, $Res> get asyncAbilityList;
  $AsyncValueCopyWith<List<List<Pokemon>>, $Res> get asyncEvolutionLine;
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
    Object? pokemon = freezed,
    Object? asyncMoveList = freezed,
    Object? asyncPokemonFlavorTextList = freezed,
    Object? asyncAbilityList = freezed,
    Object? asyncEvolutionLine = freezed,
  }) {
    return _then(_value.copyWith(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      asyncMoveList: asyncMoveList == freezed
          ? _value.asyncMoveList
          : asyncMoveList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Move>>,
      asyncPokemonFlavorTextList: asyncPokemonFlavorTextList == freezed
          ? _value.asyncPokemonFlavorTextList
          : asyncPokemonFlavorTextList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<PokemonFlavorText>>,
      asyncAbilityList: asyncAbilityList == freezed
          ? _value.asyncAbilityList
          : asyncAbilityList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Ability>>,
      asyncEvolutionLine: asyncEvolutionLine == freezed
          ? _value.asyncEvolutionLine
          : asyncEvolutionLine // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<List<Pokemon>>>,
    ));
  }

  @override
  $PokemonCopyWith<$Res> get pokemon {
    return $PokemonCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoveList {
    return $AsyncValueCopyWith<List<Move>, $Res>(_value.asyncMoveList, (value) {
      return _then(_value.copyWith(asyncMoveList: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<PokemonFlavorText>, $Res>
      get asyncPokemonFlavorTextList {
    return $AsyncValueCopyWith<List<PokemonFlavorText>, $Res>(
        _value.asyncPokemonFlavorTextList, (value) {
      return _then(_value.copyWith(asyncPokemonFlavorTextList: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<Ability>, $Res> get asyncAbilityList {
    return $AsyncValueCopyWith<List<Ability>, $Res>(_value.asyncAbilityList,
        (value) {
      return _then(_value.copyWith(asyncAbilityList: value));
    });
  }

  @override
  $AsyncValueCopyWith<List<List<Pokemon>>, $Res> get asyncEvolutionLine {
    return $AsyncValueCopyWith<List<List<Pokemon>>, $Res>(
        _value.asyncEvolutionLine, (value) {
      return _then(_value.copyWith(asyncEvolutionLine: value));
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
      {Pokemon pokemon,
      AsyncValue<List<Move>> asyncMoveList,
      AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
      AsyncValue<List<Ability>> asyncAbilityList,
      AsyncValue<List<List<Pokemon>>> asyncEvolutionLine});

  @override
  $PokemonCopyWith<$Res> get pokemon;
  @override
  $AsyncValueCopyWith<List<Move>, $Res> get asyncMoveList;
  @override
  $AsyncValueCopyWith<List<PokemonFlavorText>, $Res>
      get asyncPokemonFlavorTextList;
  @override
  $AsyncValueCopyWith<List<Ability>, $Res> get asyncAbilityList;
  @override
  $AsyncValueCopyWith<List<List<Pokemon>>, $Res> get asyncEvolutionLine;
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
    Object? pokemon = freezed,
    Object? asyncMoveList = freezed,
    Object? asyncPokemonFlavorTextList = freezed,
    Object? asyncAbilityList = freezed,
    Object? asyncEvolutionLine = freezed,
  }) {
    return _then(_PokemonDetailState(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      asyncMoveList: asyncMoveList == freezed
          ? _value.asyncMoveList
          : asyncMoveList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Move>>,
      asyncPokemonFlavorTextList: asyncPokemonFlavorTextList == freezed
          ? _value.asyncPokemonFlavorTextList
          : asyncPokemonFlavorTextList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<PokemonFlavorText>>,
      asyncAbilityList: asyncAbilityList == freezed
          ? _value.asyncAbilityList
          : asyncAbilityList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Ability>>,
      asyncEvolutionLine: asyncEvolutionLine == freezed
          ? _value.asyncEvolutionLine
          : asyncEvolutionLine // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<List<Pokemon>>>,
    ));
  }
}

/// @nodoc

class _$_PokemonDetailState extends _PokemonDetailState
    with DiagnosticableTreeMixin {
  const _$_PokemonDetailState(
      {required this.pokemon,
      required this.asyncMoveList,
      required this.asyncPokemonFlavorTextList,
      required this.asyncAbilityList,
      required this.asyncEvolutionLine})
      : super._();

  @override
  final Pokemon pokemon;
  @override
  final AsyncValue<List<Move>> asyncMoveList;
  @override
  final AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList;
  @override
  final AsyncValue<List<Ability>> asyncAbilityList;
  @override
  final AsyncValue<List<List<Pokemon>>> asyncEvolutionLine;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonDetailState(pokemon: $pokemon, asyncMoveList: $asyncMoveList, asyncPokemonFlavorTextList: $asyncPokemonFlavorTextList, asyncAbilityList: $asyncAbilityList, asyncEvolutionLine: $asyncEvolutionLine)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonDetailState'))
      ..add(DiagnosticsProperty('pokemon', pokemon))
      ..add(DiagnosticsProperty('asyncMoveList', asyncMoveList))
      ..add(DiagnosticsProperty(
          'asyncPokemonFlavorTextList', asyncPokemonFlavorTextList))
      ..add(DiagnosticsProperty('asyncAbilityList', asyncAbilityList))
      ..add(DiagnosticsProperty('asyncEvolutionLine', asyncEvolutionLine));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonDetailState &&
            (identical(other.pokemon, pokemon) ||
                const DeepCollectionEquality()
                    .equals(other.pokemon, pokemon)) &&
            (identical(other.asyncMoveList, asyncMoveList) ||
                const DeepCollectionEquality()
                    .equals(other.asyncMoveList, asyncMoveList)) &&
            (identical(other.asyncPokemonFlavorTextList,
                    asyncPokemonFlavorTextList) ||
                const DeepCollectionEquality().equals(
                    other.asyncPokemonFlavorTextList,
                    asyncPokemonFlavorTextList)) &&
            (identical(other.asyncAbilityList, asyncAbilityList) ||
                const DeepCollectionEquality()
                    .equals(other.asyncAbilityList, asyncAbilityList)) &&
            (identical(other.asyncEvolutionLine, asyncEvolutionLine) ||
                const DeepCollectionEquality()
                    .equals(other.asyncEvolutionLine, asyncEvolutionLine)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pokemon) ^
      const DeepCollectionEquality().hash(asyncMoveList) ^
      const DeepCollectionEquality().hash(asyncPokemonFlavorTextList) ^
      const DeepCollectionEquality().hash(asyncAbilityList) ^
      const DeepCollectionEquality().hash(asyncEvolutionLine);

  @JsonKey(ignore: true)
  @override
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      __$PokemonDetailStateCopyWithImpl<_PokemonDetailState>(this, _$identity);
}

abstract class _PokemonDetailState extends PokemonDetailState {
  const factory _PokemonDetailState(
      {required Pokemon pokemon,
      required AsyncValue<List<Move>> asyncMoveList,
      required AsyncValue<List<PokemonFlavorText>> asyncPokemonFlavorTextList,
      required AsyncValue<List<Ability>> asyncAbilityList,
      required AsyncValue<List<List<Pokemon>>>
          asyncEvolutionLine}) = _$_PokemonDetailState;
  const _PokemonDetailState._() : super._();

  @override
  Pokemon get pokemon => throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Move>> get asyncMoveList =>
      throw _privateConstructorUsedError;
  @override
  AsyncValue<List<PokemonFlavorText>> get asyncPokemonFlavorTextList =>
      throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Ability>> get asyncAbilityList =>
      throw _privateConstructorUsedError;
  @override
  AsyncValue<List<List<Pokemon>>> get asyncEvolutionLine =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonDetailStateCopyWith<_PokemonDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
