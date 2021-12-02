// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ability_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AbilityInfoStateTearOff {
  const _$AbilityInfoStateTearOff();

  _AbilityInfoState call(
      {required Ability ability,
      required AsyncValue<List<Pokemon>> asyncPokemonList}) {
    return _AbilityInfoState(
      ability: ability,
      asyncPokemonList: asyncPokemonList,
    );
  }
}

/// @nodoc
const $AbilityInfoState = _$AbilityInfoStateTearOff();

/// @nodoc
mixin _$AbilityInfoState {
  Ability get ability => throw _privateConstructorUsedError;
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AbilityInfoStateCopyWith<AbilityInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityInfoStateCopyWith<$Res> {
  factory $AbilityInfoStateCopyWith(
          AbilityInfoState value, $Res Function(AbilityInfoState) then) =
      _$AbilityInfoStateCopyWithImpl<$Res>;
  $Res call({Ability ability, AsyncValue<List<Pokemon>> asyncPokemonList});

  $AbilityCopyWith<$Res> get ability;
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList;
}

/// @nodoc
class _$AbilityInfoStateCopyWithImpl<$Res>
    implements $AbilityInfoStateCopyWith<$Res> {
  _$AbilityInfoStateCopyWithImpl(this._value, this._then);

  final AbilityInfoState _value;
  // ignore: unused_field
  final $Res Function(AbilityInfoState) _then;

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

  @override
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList {
    return $AsyncValueCopyWith<List<Pokemon>, $Res>(_value.asyncPokemonList,
        (value) {
      return _then(_value.copyWith(asyncPokemonList: value));
    });
  }
}

/// @nodoc
abstract class _$AbilityInfoStateCopyWith<$Res>
    implements $AbilityInfoStateCopyWith<$Res> {
  factory _$AbilityInfoStateCopyWith(
          _AbilityInfoState value, $Res Function(_AbilityInfoState) then) =
      __$AbilityInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({Ability ability, AsyncValue<List<Pokemon>> asyncPokemonList});

  @override
  $AbilityCopyWith<$Res> get ability;
  @override
  $AsyncValueCopyWith<List<Pokemon>, $Res> get asyncPokemonList;
}

/// @nodoc
class __$AbilityInfoStateCopyWithImpl<$Res>
    extends _$AbilityInfoStateCopyWithImpl<$Res>
    implements _$AbilityInfoStateCopyWith<$Res> {
  __$AbilityInfoStateCopyWithImpl(
      _AbilityInfoState _value, $Res Function(_AbilityInfoState) _then)
      : super(_value, (v) => _then(v as _AbilityInfoState));

  @override
  _AbilityInfoState get _value => super._value as _AbilityInfoState;

  @override
  $Res call({
    Object? ability = freezed,
    Object? asyncPokemonList = freezed,
  }) {
    return _then(_AbilityInfoState(
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

class _$_AbilityInfoState extends _AbilityInfoState
    with DiagnosticableTreeMixin {
  const _$_AbilityInfoState(
      {required this.ability, required this.asyncPokemonList})
      : super._();

  @override
  final Ability ability;
  @override
  final AsyncValue<List<Pokemon>> asyncPokemonList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AbilityInfoState(ability: $ability, asyncPokemonList: $asyncPokemonList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AbilityInfoState'))
      ..add(DiagnosticsProperty('ability', ability))
      ..add(DiagnosticsProperty('asyncPokemonList', asyncPokemonList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AbilityInfoState &&
            (identical(other.ability, ability) ||
                const DeepCollectionEquality()
                    .equals(other.ability, ability)) &&
            (identical(other.asyncPokemonList, asyncPokemonList) ||
                const DeepCollectionEquality()
                    .equals(other.asyncPokemonList, asyncPokemonList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ability) ^
      const DeepCollectionEquality().hash(asyncPokemonList);

  @JsonKey(ignore: true)
  @override
  _$AbilityInfoStateCopyWith<_AbilityInfoState> get copyWith =>
      __$AbilityInfoStateCopyWithImpl<_AbilityInfoState>(this, _$identity);
}

abstract class _AbilityInfoState extends AbilityInfoState {
  const factory _AbilityInfoState(
          {required Ability ability,
          required AsyncValue<List<Pokemon>> asyncPokemonList}) =
      _$_AbilityInfoState;
  const _AbilityInfoState._() : super._();

  @override
  Ability get ability => throw _privateConstructorUsedError;
  @override
  AsyncValue<List<Pokemon>> get asyncPokemonList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AbilityInfoStateCopyWith<_AbilityInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
