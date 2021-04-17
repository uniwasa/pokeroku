// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokedex_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokedexStateTearOff {
  const _$PokedexStateTearOff();

  _PokedexState call({List<Pokemon>? pokemons}) {
    return _PokedexState(
      pokemons: pokemons,
    );
  }
}

/// @nodoc
const $PokedexState = _$PokedexStateTearOff();

/// @nodoc
mixin _$PokedexState {
  List<Pokemon>? get pokemons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokedexStateCopyWith<PokedexState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexStateCopyWith<$Res> {
  factory $PokedexStateCopyWith(
          PokedexState value, $Res Function(PokedexState) then) =
      _$PokedexStateCopyWithImpl<$Res>;
  $Res call({List<Pokemon>? pokemons});
}

/// @nodoc
class _$PokedexStateCopyWithImpl<$Res> implements $PokedexStateCopyWith<$Res> {
  _$PokedexStateCopyWithImpl(this._value, this._then);

  final PokedexState _value;
  // ignore: unused_field
  final $Res Function(PokedexState) _then;

  @override
  $Res call({
    Object? pokemons = freezed,
  }) {
    return _then(_value.copyWith(
      pokemons: pokemons == freezed
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ));
  }
}

/// @nodoc
abstract class _$PokedexStateCopyWith<$Res>
    implements $PokedexStateCopyWith<$Res> {
  factory _$PokedexStateCopyWith(
          _PokedexState value, $Res Function(_PokedexState) then) =
      __$PokedexStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Pokemon>? pokemons});
}

/// @nodoc
class __$PokedexStateCopyWithImpl<$Res> extends _$PokedexStateCopyWithImpl<$Res>
    implements _$PokedexStateCopyWith<$Res> {
  __$PokedexStateCopyWithImpl(
      _PokedexState _value, $Res Function(_PokedexState) _then)
      : super(_value, (v) => _then(v as _PokedexState));

  @override
  _PokedexState get _value => super._value as _PokedexState;

  @override
  $Res call({
    Object? pokemons = freezed,
  }) {
    return _then(_PokedexState(
      pokemons: pokemons == freezed
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ));
  }
}

/// @nodoc
class _$_PokedexState with DiagnosticableTreeMixin implements _PokedexState {
  const _$_PokedexState({this.pokemons});

  @override
  final List<Pokemon>? pokemons;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokedexState(pokemons: $pokemons)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokedexState'))
      ..add(DiagnosticsProperty('pokemons', pokemons));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokedexState &&
            (identical(other.pokemons, pokemons) ||
                const DeepCollectionEquality()
                    .equals(other.pokemons, pokemons)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(pokemons);

  @JsonKey(ignore: true)
  @override
  _$PokedexStateCopyWith<_PokedexState> get copyWith =>
      __$PokedexStateCopyWithImpl<_PokedexState>(this, _$identity);
}

abstract class _PokedexState implements PokedexState {
  const factory _PokedexState({List<Pokemon>? pokemons}) = _$_PokedexState;

  @override
  List<Pokemon>? get pokemons => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokedexStateCopyWith<_PokedexState> get copyWith =>
      throw _privateConstructorUsedError;
}
