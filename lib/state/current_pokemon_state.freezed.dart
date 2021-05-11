// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'current_pokemon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentPokemonStateTearOff {
  const _$CurrentPokemonStateTearOff();

  _CurrentPokemonState call({Pokemon? pokemon}) {
    return _CurrentPokemonState(
      pokemon: pokemon,
    );
  }
}

/// @nodoc
const $CurrentPokemonState = _$CurrentPokemonStateTearOff();

/// @nodoc
mixin _$CurrentPokemonState {
  Pokemon? get pokemon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentPokemonStateCopyWith<CurrentPokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPokemonStateCopyWith<$Res> {
  factory $CurrentPokemonStateCopyWith(
          CurrentPokemonState value, $Res Function(CurrentPokemonState) then) =
      _$CurrentPokemonStateCopyWithImpl<$Res>;
  $Res call({Pokemon? pokemon});

  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class _$CurrentPokemonStateCopyWithImpl<$Res>
    implements $CurrentPokemonStateCopyWith<$Res> {
  _$CurrentPokemonStateCopyWithImpl(this._value, this._then);

  final CurrentPokemonState _value;
  // ignore: unused_field
  final $Res Function(CurrentPokemonState) _then;

  @override
  $Res call({
    Object? pokemon = freezed,
  }) {
    return _then(_value.copyWith(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }

  @override
  $PokemonCopyWith<$Res>? get pokemon {
    if (_value.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_value.pokemon!, (value) {
      return _then(_value.copyWith(pokemon: value));
    });
  }
}

/// @nodoc
abstract class _$CurrentPokemonStateCopyWith<$Res>
    implements $CurrentPokemonStateCopyWith<$Res> {
  factory _$CurrentPokemonStateCopyWith(_CurrentPokemonState value,
          $Res Function(_CurrentPokemonState) then) =
      __$CurrentPokemonStateCopyWithImpl<$Res>;
  @override
  $Res call({Pokemon? pokemon});

  @override
  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class __$CurrentPokemonStateCopyWithImpl<$Res>
    extends _$CurrentPokemonStateCopyWithImpl<$Res>
    implements _$CurrentPokemonStateCopyWith<$Res> {
  __$CurrentPokemonStateCopyWithImpl(
      _CurrentPokemonState _value, $Res Function(_CurrentPokemonState) _then)
      : super(_value, (v) => _then(v as _CurrentPokemonState));

  @override
  _CurrentPokemonState get _value => super._value as _CurrentPokemonState;

  @override
  $Res call({
    Object? pokemon = freezed,
  }) {
    return _then(_CurrentPokemonState(
      pokemon: pokemon == freezed
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as Pokemon?,
    ));
  }
}

/// @nodoc
class _$_CurrentPokemonState implements _CurrentPokemonState {
  const _$_CurrentPokemonState({this.pokemon});

  @override
  final Pokemon? pokemon;

  @override
  String toString() {
    return 'CurrentPokemonState(pokemon: $pokemon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CurrentPokemonState &&
            (identical(other.pokemon, pokemon) ||
                const DeepCollectionEquality().equals(other.pokemon, pokemon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pokemon);

  @JsonKey(ignore: true)
  @override
  _$CurrentPokemonStateCopyWith<_CurrentPokemonState> get copyWith =>
      __$CurrentPokemonStateCopyWithImpl<_CurrentPokemonState>(
          this, _$identity);
}

abstract class _CurrentPokemonState implements CurrentPokemonState {
  const factory _CurrentPokemonState({Pokemon? pokemon}) =
      _$_CurrentPokemonState;

  @override
  Pokemon? get pokemon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CurrentPokemonStateCopyWith<_CurrentPokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}
