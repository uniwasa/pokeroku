// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon_ex.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonExTearOff {
  const _$PokemonExTearOff();

  _PokemonEx call(
      {required Pokemon base,
      required String flavorTextJp,
      required List<List<Pokemon>> evolutions,
      required List<double>? genderRatio,
      required List<Ability> normalAbilities,
      required Ability? hiddenAbility}) {
    return _PokemonEx(
      base: base,
      flavorTextJp: flavorTextJp,
      evolutions: evolutions,
      genderRatio: genderRatio,
      normalAbilities: normalAbilities,
      hiddenAbility: hiddenAbility,
    );
  }
}

/// @nodoc
const $PokemonEx = _$PokemonExTearOff();

/// @nodoc
mixin _$PokemonEx {
  Pokemon get base => throw _privateConstructorUsedError;
  String get flavorTextJp => throw _privateConstructorUsedError;
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  List<double>? get genderRatio => throw _privateConstructorUsedError;
  List<Ability> get normalAbilities => throw _privateConstructorUsedError;
  Ability? get hiddenAbility => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonExCopyWith<PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonExCopyWith<$Res> {
  factory $PokemonExCopyWith(PokemonEx value, $Res Function(PokemonEx) then) =
      _$PokemonExCopyWithImpl<$Res>;
  $Res call(
      {Pokemon base,
      String flavorTextJp,
      List<List<Pokemon>> evolutions,
      List<double>? genderRatio,
      List<Ability> normalAbilities,
      Ability? hiddenAbility});

  $PokemonCopyWith<$Res> get base;
  $AbilityCopyWith<$Res>? get hiddenAbility;
}

/// @nodoc
class _$PokemonExCopyWithImpl<$Res> implements $PokemonExCopyWith<$Res> {
  _$PokemonExCopyWithImpl(this._value, this._then);

  final PokemonEx _value;
  // ignore: unused_field
  final $Res Function(PokemonEx) _then;

  @override
  $Res call({
    Object? base = freezed,
    Object? flavorTextJp = freezed,
    Object? evolutions = freezed,
    Object? genderRatio = freezed,
    Object? normalAbilities = freezed,
    Object? hiddenAbility = freezed,
  }) {
    return _then(_value.copyWith(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
      evolutions: evolutions == freezed
          ? _value.evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<List<Pokemon>>,
      genderRatio: genderRatio == freezed
          ? _value.genderRatio
          : genderRatio // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      normalAbilities: normalAbilities == freezed
          ? _value.normalAbilities
          : normalAbilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      hiddenAbility: hiddenAbility == freezed
          ? _value.hiddenAbility
          : hiddenAbility // ignore: cast_nullable_to_non_nullable
              as Ability?,
    ));
  }

  @override
  $PokemonCopyWith<$Res> get base {
    return $PokemonCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value));
    });
  }

  @override
  $AbilityCopyWith<$Res>? get hiddenAbility {
    if (_value.hiddenAbility == null) {
      return null;
    }

    return $AbilityCopyWith<$Res>(_value.hiddenAbility!, (value) {
      return _then(_value.copyWith(hiddenAbility: value));
    });
  }
}

/// @nodoc
abstract class _$PokemonExCopyWith<$Res> implements $PokemonExCopyWith<$Res> {
  factory _$PokemonExCopyWith(
          _PokemonEx value, $Res Function(_PokemonEx) then) =
      __$PokemonExCopyWithImpl<$Res>;
  @override
  $Res call(
      {Pokemon base,
      String flavorTextJp,
      List<List<Pokemon>> evolutions,
      List<double>? genderRatio,
      List<Ability> normalAbilities,
      Ability? hiddenAbility});

  @override
  $PokemonCopyWith<$Res> get base;
  @override
  $AbilityCopyWith<$Res>? get hiddenAbility;
}

/// @nodoc
class __$PokemonExCopyWithImpl<$Res> extends _$PokemonExCopyWithImpl<$Res>
    implements _$PokemonExCopyWith<$Res> {
  __$PokemonExCopyWithImpl(_PokemonEx _value, $Res Function(_PokemonEx) _then)
      : super(_value, (v) => _then(v as _PokemonEx));

  @override
  _PokemonEx get _value => super._value as _PokemonEx;

  @override
  $Res call({
    Object? base = freezed,
    Object? flavorTextJp = freezed,
    Object? evolutions = freezed,
    Object? genderRatio = freezed,
    Object? normalAbilities = freezed,
    Object? hiddenAbility = freezed,
  }) {
    return _then(_PokemonEx(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
      evolutions: evolutions == freezed
          ? _value.evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<List<Pokemon>>,
      genderRatio: genderRatio == freezed
          ? _value.genderRatio
          : genderRatio // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      normalAbilities: normalAbilities == freezed
          ? _value.normalAbilities
          : normalAbilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
      hiddenAbility: hiddenAbility == freezed
          ? _value.hiddenAbility
          : hiddenAbility // ignore: cast_nullable_to_non_nullable
              as Ability?,
    ));
  }
}

/// @nodoc

class _$_PokemonEx extends _PokemonEx with DiagnosticableTreeMixin {
  const _$_PokemonEx(
      {required this.base,
      required this.flavorTextJp,
      required this.evolutions,
      required this.genderRatio,
      required this.normalAbilities,
      required this.hiddenAbility})
      : super._();

  @override
  final Pokemon base;
  @override
  final String flavorTextJp;
  @override
  final List<List<Pokemon>> evolutions;
  @override
  final List<double>? genderRatio;
  @override
  final List<Ability> normalAbilities;
  @override
  final Ability? hiddenAbility;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEx(base: $base, flavorTextJp: $flavorTextJp, evolutions: $evolutions, genderRatio: $genderRatio, normalAbilities: $normalAbilities, hiddenAbility: $hiddenAbility)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonEx'))
      ..add(DiagnosticsProperty('base', base))
      ..add(DiagnosticsProperty('flavorTextJp', flavorTextJp))
      ..add(DiagnosticsProperty('evolutions', evolutions))
      ..add(DiagnosticsProperty('genderRatio', genderRatio))
      ..add(DiagnosticsProperty('normalAbilities', normalAbilities))
      ..add(DiagnosticsProperty('hiddenAbility', hiddenAbility));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonEx &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.flavorTextJp, flavorTextJp) ||
                const DeepCollectionEquality()
                    .equals(other.flavorTextJp, flavorTextJp)) &&
            (identical(other.evolutions, evolutions) ||
                const DeepCollectionEquality()
                    .equals(other.evolutions, evolutions)) &&
            (identical(other.genderRatio, genderRatio) ||
                const DeepCollectionEquality()
                    .equals(other.genderRatio, genderRatio)) &&
            (identical(other.normalAbilities, normalAbilities) ||
                const DeepCollectionEquality()
                    .equals(other.normalAbilities, normalAbilities)) &&
            (identical(other.hiddenAbility, hiddenAbility) ||
                const DeepCollectionEquality()
                    .equals(other.hiddenAbility, hiddenAbility)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(flavorTextJp) ^
      const DeepCollectionEquality().hash(evolutions) ^
      const DeepCollectionEquality().hash(genderRatio) ^
      const DeepCollectionEquality().hash(normalAbilities) ^
      const DeepCollectionEquality().hash(hiddenAbility);

  @JsonKey(ignore: true)
  @override
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      __$PokemonExCopyWithImpl<_PokemonEx>(this, _$identity);
}

abstract class _PokemonEx extends PokemonEx {
  const factory _PokemonEx(
      {required Pokemon base,
      required String flavorTextJp,
      required List<List<Pokemon>> evolutions,
      required List<double>? genderRatio,
      required List<Ability> normalAbilities,
      required Ability? hiddenAbility}) = _$_PokemonEx;
  const _PokemonEx._() : super._();

  @override
  Pokemon get base => throw _privateConstructorUsedError;
  @override
  String get flavorTextJp => throw _privateConstructorUsedError;
  @override
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  @override
  List<double>? get genderRatio => throw _privateConstructorUsedError;
  @override
  List<Ability> get normalAbilities => throw _privateConstructorUsedError;
  @override
  Ability? get hiddenAbility => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}
