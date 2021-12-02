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
      required List<List<Pokemon>> evolutions,
      required List<Ability> abilities}) {
    return _PokemonEx(
      base: base,
      evolutions: evolutions,
      abilities: abilities,
    );
  }
}

/// @nodoc
const $PokemonEx = _$PokemonExTearOff();

/// @nodoc
mixin _$PokemonEx {
  Pokemon get base => throw _privateConstructorUsedError;
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  List<Ability> get abilities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonExCopyWith<PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonExCopyWith<$Res> {
  factory $PokemonExCopyWith(PokemonEx value, $Res Function(PokemonEx) then) =
      _$PokemonExCopyWithImpl<$Res>;
  $Res call(
      {Pokemon base, List<List<Pokemon>> evolutions, List<Ability> abilities});

  $PokemonCopyWith<$Res> get base;
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
    Object? evolutions = freezed,
    Object? abilities = freezed,
  }) {
    return _then(_value.copyWith(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      evolutions: evolutions == freezed
          ? _value.evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<List<Pokemon>>,
      abilities: abilities == freezed
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
    ));
  }

  @override
  $PokemonCopyWith<$Res> get base {
    return $PokemonCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value));
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
      {Pokemon base, List<List<Pokemon>> evolutions, List<Ability> abilities});

  @override
  $PokemonCopyWith<$Res> get base;
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
    Object? evolutions = freezed,
    Object? abilities = freezed,
  }) {
    return _then(_PokemonEx(
      base: base == freezed
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Pokemon,
      evolutions: evolutions == freezed
          ? _value.evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<List<Pokemon>>,
      abilities: abilities == freezed
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<Ability>,
    ));
  }
}

/// @nodoc

class _$_PokemonEx extends _PokemonEx with DiagnosticableTreeMixin {
  const _$_PokemonEx(
      {required this.base, required this.evolutions, required this.abilities})
      : super._();

  @override
  final Pokemon base;
  @override
  final List<List<Pokemon>> evolutions;
  @override
  final List<Ability> abilities;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEx(base: $base, evolutions: $evolutions, abilities: $abilities)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonEx'))
      ..add(DiagnosticsProperty('base', base))
      ..add(DiagnosticsProperty('evolutions', evolutions))
      ..add(DiagnosticsProperty('abilities', abilities));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonEx &&
            (identical(other.base, base) ||
                const DeepCollectionEquality().equals(other.base, base)) &&
            (identical(other.evolutions, evolutions) ||
                const DeepCollectionEquality()
                    .equals(other.evolutions, evolutions)) &&
            (identical(other.abilities, abilities) ||
                const DeepCollectionEquality()
                    .equals(other.abilities, abilities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(base) ^
      const DeepCollectionEquality().hash(evolutions) ^
      const DeepCollectionEquality().hash(abilities);

  @JsonKey(ignore: true)
  @override
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      __$PokemonExCopyWithImpl<_PokemonEx>(this, _$identity);
}

abstract class _PokemonEx extends PokemonEx {
  const factory _PokemonEx(
      {required Pokemon base,
      required List<List<Pokemon>> evolutions,
      required List<Ability> abilities}) = _$_PokemonEx;
  const _PokemonEx._() : super._();

  @override
  Pokemon get base => throw _privateConstructorUsedError;
  @override
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  @override
  List<Ability> get abilities => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}
