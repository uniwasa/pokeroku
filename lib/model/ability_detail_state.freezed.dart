// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ability_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AbilityDetailStateTearOff {
  const _$AbilityDetailStateTearOff();

  _AbilityDetailState call(
      {required Ability ability,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) {
    return _AbilityDetailState(
      ability: ability,
      asyncPokemonList: asyncPokemonList,
    );
  }
}

/// @nodoc
const $AbilityDetailState = _$AbilityDetailStateTearOff();

/// @nodoc
mixin _$AbilityDetailState {
  Ability get ability => throw _privateConstructorUsedError;
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AbilityDetailStateCopyWith<AbilityDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityDetailStateCopyWith<$Res> {
  factory $AbilityDetailStateCopyWith(
          AbilityDetailState value, $Res Function(AbilityDetailState) then) =
      _$AbilityDetailStateCopyWithImpl<$Res>;
  $Res call({Ability ability, AsyncValue<List<Pokemon>> asyncPokemonList});

  $AbilityCopyWith<$Res> get ability;
}

/// @nodoc
class _$AbilityDetailStateCopyWithImpl<$Res>
    implements $AbilityDetailStateCopyWith<$Res> {
  _$AbilityDetailStateCopyWithImpl(this._value, this._then);

  final AbilityDetailState _value;
  // ignore: unused_field
  final $Res Function(AbilityDetailState) _then;

  @override
  $Res call({
    Object? ability = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_value.copyWith(
      ability: ability == freezed
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      asyncPokemonList: asyncPokemonList == freezed
          ? _value.asyncPokemonList
          : asyncPokemonList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Pokemon>>,
    ));
  }

  @override
  $AbilityCopyWith<$Res> get ability {
    return $AbilityCopyWith<$Res>(_value.ability, (value) {
      return _then(_value.copyWith(ability: value));
    });
  }
}

/// @nodoc
abstract class _$AbilityDetailStateCopyWith<$Res>
    implements $AbilityDetailStateCopyWith<$Res> {
  factory _$AbilityDetailStateCopyWith(
          _AbilityDetailState value, $Res Function(_AbilityDetailState) then) =
      __$AbilityDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({Ability ability, AsyncValue<List<Pokemon>> asyncPokemonList});

  @override
  $AbilityCopyWith<$Res> get ability;
}

/// @nodoc
class __$AbilityDetailStateCopyWithImpl<$Res>
    extends _$AbilityDetailStateCopyWithImpl<$Res>
    implements _$AbilityDetailStateCopyWith<$Res> {
  __$AbilityDetailStateCopyWithImpl(
      _AbilityDetailState _value, $Res Function(_AbilityDetailState) _then)
      : super(_value, (v) => _then(v as _AbilityDetailState));

  @override
  _AbilityDetailState get _value => super._value as _AbilityDetailState;

  @override
  $Res call({
    Object? ability = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_AbilityDetailState(
      ability: ability == freezed
          ? _value.ability
          : ability // ignore: cast_nullable_to_non_nullable
              as Ability,
      asyncPokemonList: asyncPokemonList == freezed
          ? _value.asyncPokemonList
          : asyncPokemonList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Pokemon>>,
    ));
  }
}

/// @nodoc

class _$_AbilityDetailState extends _AbilityDetailState
    with DiagnosticableTreeMixin {
  const _$_AbilityDetailState(
      {required this.ability, required this.asyncPokemonList})
      : super._();

  @override
  final Ability ability;
  @override
  final AsyncValue<List<Pokemon>> asyncPokemonList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AbilityDetailState(ability: $ability, asyncPokemonList: $asyncPokemonList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AbilityDetailState'))
      ..add(DiagnosticsProperty('ability', ability))
      ..add(DiagnosticsProperty('asyncPokemonList', asyncPokemonList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AbilityDetailState &&
            const DeepCollectionEquality().equals(other.ability, ability) &&
            const DeepCollectionEquality()
                .equals(other.asyncPokemonList, asyncPokemonList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ability),
      const DeepCollectionEquality().hash(asyncPokemonList));

  @JsonKey(ignore: true)
  @override
  _$AbilityDetailStateCopyWith<_AbilityDetailState> get copyWith =>
      __$AbilityDetailStateCopyWithImpl<_AbilityDetailState>(this, _$identity);
}

abstract class _AbilityDetailState extends AbilityDetailState {
  const factory _AbilityDetailState(
          {required Ability ability,
          required AsyncValue<List<Pokemon>> asyncPokemonList}) =
      _$_AbilityDetailState;
  const _AbilityDetailState._() : super._();

  @override
  Ability get ability;
  @override
  AsyncValue<List<Pokemon>> get asyncPokemonList;
  @override
  @JsonKey(ignore: true)
  _$AbilityDetailStateCopyWith<_AbilityDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
