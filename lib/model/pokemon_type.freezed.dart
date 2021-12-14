// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonTypeTearOff {
  const _$PokemonTypeTearOff();

  _PokemonType call(
      {required int id,
      required String identifier,
      @JsonKey(name: 'name_jp') required String nameJp,
      @JsonKey(name: 'damage_factors') required Map<int, dynamic> damageFactors,
      required Color color}) {
    return _PokemonType(
      id: id,
      identifier: identifier,
      nameJp: nameJp,
      damageFactors: damageFactors,
      color: color,
    );
  }
}

/// @nodoc
const $PokemonType = _$PokemonTypeTearOff();

/// @nodoc
mixin _$PokemonType {
  int get id => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_jp')
  String get nameJp => throw _privateConstructorUsedError;
  @JsonKey(name: 'damage_factors')
  Map<int, dynamic> get damageFactors => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonTypeCopyWith<PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeCopyWith<$Res> {
  factory $PokemonTypeCopyWith(
          PokemonType value, $Res Function(PokemonType) then) =
      _$PokemonTypeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String identifier,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'damage_factors') Map<int, dynamic> damageFactors,
      Color color});
}

/// @nodoc
class _$PokemonTypeCopyWithImpl<$Res> implements $PokemonTypeCopyWith<$Res> {
  _$PokemonTypeCopyWithImpl(this._value, this._then);

  final PokemonType _value;
  // ignore: unused_field
  final $Res Function(PokemonType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? nameJp = freezed,
    Object? damageFactors = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      damageFactors: damageFactors == freezed
          ? _value.damageFactors
          : damageFactors // ignore: cast_nullable_to_non_nullable
              as Map<int, dynamic>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
abstract class _$PokemonTypeCopyWith<$Res>
    implements $PokemonTypeCopyWith<$Res> {
  factory _$PokemonTypeCopyWith(
          _PokemonType value, $Res Function(_PokemonType) then) =
      __$PokemonTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String identifier,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'damage_factors') Map<int, dynamic> damageFactors,
      Color color});
}

/// @nodoc
class __$PokemonTypeCopyWithImpl<$Res> extends _$PokemonTypeCopyWithImpl<$Res>
    implements _$PokemonTypeCopyWith<$Res> {
  __$PokemonTypeCopyWithImpl(
      _PokemonType _value, $Res Function(_PokemonType) _then)
      : super(_value, (v) => _then(v as _PokemonType));

  @override
  _PokemonType get _value => super._value as _PokemonType;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? nameJp = freezed,
    Object? damageFactors = freezed,
    Object? color = freezed,
  }) {
    return _then(_PokemonType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      damageFactors: damageFactors == freezed
          ? _value.damageFactors
          : damageFactors // ignore: cast_nullable_to_non_nullable
              as Map<int, dynamic>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_PokemonType extends _PokemonType with DiagnosticableTreeMixin {
  const _$_PokemonType(
      {required this.id,
      required this.identifier,
      @JsonKey(name: 'name_jp') required this.nameJp,
      @JsonKey(name: 'damage_factors') required this.damageFactors,
      required this.color})
      : super._();

  @override
  final int id;
  @override
  final String identifier;
  @override
  @JsonKey(name: 'name_jp')
  final String nameJp;
  @override
  @JsonKey(name: 'damage_factors')
  final Map<int, dynamic> damageFactors;
  @override
  final Color color;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonType(id: $id, identifier: $identifier, nameJp: $nameJp, damageFactors: $damageFactors, color: $color)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonType'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('nameJp', nameJp))
      ..add(DiagnosticsProperty('damageFactors', damageFactors))
      ..add(DiagnosticsProperty('color', color));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PokemonType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.identifier, identifier) &&
            const DeepCollectionEquality().equals(other.nameJp, nameJp) &&
            const DeepCollectionEquality()
                .equals(other.damageFactors, damageFactors) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(identifier),
      const DeepCollectionEquality().hash(nameJp),
      const DeepCollectionEquality().hash(damageFactors),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$PokemonTypeCopyWith<_PokemonType> get copyWith =>
      __$PokemonTypeCopyWithImpl<_PokemonType>(this, _$identity);
}

abstract class _PokemonType extends PokemonType {
  const factory _PokemonType(
      {required int id,
      required String identifier,
      @JsonKey(name: 'name_jp') required String nameJp,
      @JsonKey(name: 'damage_factors') required Map<int, dynamic> damageFactors,
      required Color color}) = _$_PokemonType;
  const _PokemonType._() : super._();

  @override
  int get id;
  @override
  String get identifier;
  @override
  @JsonKey(name: 'name_jp')
  String get nameJp;
  @override
  @JsonKey(name: 'damage_factors')
  Map<int, dynamic> get damageFactors;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$PokemonTypeCopyWith<_PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}
