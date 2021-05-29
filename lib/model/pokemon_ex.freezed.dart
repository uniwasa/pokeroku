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
      {required String flavorTextJp,
      required List<List<Pokemon>> evolutions,
      required List<double>? genderRatio}) {
    return _PokemonEx(
      flavorTextJp: flavorTextJp,
      evolutions: evolutions,
      genderRatio: genderRatio,
    );
  }
}

/// @nodoc
const $PokemonEx = _$PokemonExTearOff();

/// @nodoc
mixin _$PokemonEx {
  String get flavorTextJp => throw _privateConstructorUsedError;
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  List<double>? get genderRatio => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonExCopyWith<PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonExCopyWith<$Res> {
  factory $PokemonExCopyWith(PokemonEx value, $Res Function(PokemonEx) then) =
      _$PokemonExCopyWithImpl<$Res>;
  $Res call(
      {String flavorTextJp,
      List<List<Pokemon>> evolutions,
      List<double>? genderRatio});
}

/// @nodoc
class _$PokemonExCopyWithImpl<$Res> implements $PokemonExCopyWith<$Res> {
  _$PokemonExCopyWithImpl(this._value, this._then);

  final PokemonEx _value;
  // ignore: unused_field
  final $Res Function(PokemonEx) _then;

  @override
  $Res call({
    Object? flavorTextJp = freezed,
    Object? evolutions = freezed,
    Object? genderRatio = freezed,
  }) {
    return _then(_value.copyWith(
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
    ));
  }
}

/// @nodoc
abstract class _$PokemonExCopyWith<$Res> implements $PokemonExCopyWith<$Res> {
  factory _$PokemonExCopyWith(
          _PokemonEx value, $Res Function(_PokemonEx) then) =
      __$PokemonExCopyWithImpl<$Res>;
  @override
  $Res call(
      {String flavorTextJp,
      List<List<Pokemon>> evolutions,
      List<double>? genderRatio});
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
    Object? flavorTextJp = freezed,
    Object? evolutions = freezed,
    Object? genderRatio = freezed,
  }) {
    return _then(_PokemonEx(
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
    ));
  }
}

/// @nodoc
class _$_PokemonEx extends _PokemonEx with DiagnosticableTreeMixin {
  const _$_PokemonEx(
      {required this.flavorTextJp,
      required this.evolutions,
      required this.genderRatio})
      : super._();

  @override
  final String flavorTextJp;
  @override
  final List<List<Pokemon>> evolutions;
  @override
  final List<double>? genderRatio;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEx(flavorTextJp: $flavorTextJp, evolutions: $evolutions, genderRatio: $genderRatio)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonEx'))
      ..add(DiagnosticsProperty('flavorTextJp', flavorTextJp))
      ..add(DiagnosticsProperty('evolutions', evolutions))
      ..add(DiagnosticsProperty('genderRatio', genderRatio));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonEx &&
            (identical(other.flavorTextJp, flavorTextJp) ||
                const DeepCollectionEquality()
                    .equals(other.flavorTextJp, flavorTextJp)) &&
            (identical(other.evolutions, evolutions) ||
                const DeepCollectionEquality()
                    .equals(other.evolutions, evolutions)) &&
            (identical(other.genderRatio, genderRatio) ||
                const DeepCollectionEquality()
                    .equals(other.genderRatio, genderRatio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(flavorTextJp) ^
      const DeepCollectionEquality().hash(evolutions) ^
      const DeepCollectionEquality().hash(genderRatio);

  @JsonKey(ignore: true)
  @override
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      __$PokemonExCopyWithImpl<_PokemonEx>(this, _$identity);
}

abstract class _PokemonEx extends PokemonEx {
  const factory _PokemonEx(
      {required String flavorTextJp,
      required List<List<Pokemon>> evolutions,
      required List<double>? genderRatio}) = _$_PokemonEx;
  const _PokemonEx._() : super._();

  @override
  String get flavorTextJp => throw _privateConstructorUsedError;
  @override
  List<List<Pokemon>> get evolutions => throw _privateConstructorUsedError;
  @override
  List<double>? get genderRatio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonExCopyWith<_PokemonEx> get copyWith =>
      throw _privateConstructorUsedError;
}
