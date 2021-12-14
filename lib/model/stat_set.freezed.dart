// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stat_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatSet _$StatSetFromJson(Map<String, dynamic> json) {
  return _StatSet.fromJson(json);
}

/// @nodoc
class _$StatSetTearOff {
  const _$StatSetTearOff();

  _StatSet call(
      {int hp = 0,
      int attack = 0,
      int defense = 0,
      int specialAttack = 0,
      int specialDefense = 0,
      int speed = 0}) {
    return _StatSet(
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
  }

  StatSet fromJson(Map<String, Object?> json) {
    return StatSet.fromJson(json);
  }
}

/// @nodoc
const $StatSet = _$StatSetTearOff();

/// @nodoc
mixin _$StatSet {
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get specialAttack => throw _privateConstructorUsedError;
  int get specialDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatSetCopyWith<StatSet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatSetCopyWith<$Res> {
  factory $StatSetCopyWith(StatSet value, $Res Function(StatSet) then) =
      _$StatSetCopyWithImpl<$Res>;
  $Res call(
      {int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed});
}

/// @nodoc
class _$StatSetCopyWithImpl<$Res> implements $StatSetCopyWith<$Res> {
  _$StatSetCopyWithImpl(this._value, this._then);

  final StatSet _value;
  // ignore: unused_field
  final $Res Function(StatSet) _then;

  @override
  $Res call({
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      hp: hp == freezed
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: attack == freezed
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: defense == freezed
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      specialAttack: specialAttack == freezed
          ? _value.specialAttack
          : specialAttack // ignore: cast_nullable_to_non_nullable
              as int,
      specialDefense: specialDefense == freezed
          ? _value.specialDefense
          : specialDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatSetCopyWith<$Res> implements $StatSetCopyWith<$Res> {
  factory _$StatSetCopyWith(_StatSet value, $Res Function(_StatSet) then) =
      __$StatSetCopyWithImpl<$Res>;
  @override
  $Res call(
      {int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed});
}

/// @nodoc
class __$StatSetCopyWithImpl<$Res> extends _$StatSetCopyWithImpl<$Res>
    implements _$StatSetCopyWith<$Res> {
  __$StatSetCopyWithImpl(_StatSet _value, $Res Function(_StatSet) _then)
      : super(_value, (v) => _then(v as _StatSet));

  @override
  _StatSet get _value => super._value as _StatSet;

  @override
  $Res call({
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
  }) {
    return _then(_StatSet(
      hp: hp == freezed
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      attack: attack == freezed
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: defense == freezed
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      specialAttack: specialAttack == freezed
          ? _value.specialAttack
          : specialAttack // ignore: cast_nullable_to_non_nullable
              as int,
      specialDefense: specialDefense == freezed
          ? _value.specialDefense
          : specialDefense // ignore: cast_nullable_to_non_nullable
              as int,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatSet extends _StatSet with DiagnosticableTreeMixin {
  _$_StatSet(
      {this.hp = 0,
      this.attack = 0,
      this.defense = 0,
      this.specialAttack = 0,
      this.specialDefense = 0,
      this.speed = 0})
      : super._();

  factory _$_StatSet.fromJson(Map<String, dynamic> json) =>
      _$$_StatSetFromJson(json);

  @JsonKey()
  @override
  final int hp;
  @JsonKey()
  @override
  final int attack;
  @JsonKey()
  @override
  final int defense;
  @JsonKey()
  @override
  final int specialAttack;
  @JsonKey()
  @override
  final int specialDefense;
  @JsonKey()
  @override
  final int speed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StatSet(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StatSet'))
      ..add(DiagnosticsProperty('hp', hp))
      ..add(DiagnosticsProperty('attack', attack))
      ..add(DiagnosticsProperty('defense', defense))
      ..add(DiagnosticsProperty('specialAttack', specialAttack))
      ..add(DiagnosticsProperty('specialDefense', specialDefense))
      ..add(DiagnosticsProperty('speed', speed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatSet &&
            const DeepCollectionEquality().equals(other.hp, hp) &&
            const DeepCollectionEquality().equals(other.attack, attack) &&
            const DeepCollectionEquality().equals(other.defense, defense) &&
            const DeepCollectionEquality()
                .equals(other.specialAttack, specialAttack) &&
            const DeepCollectionEquality()
                .equals(other.specialDefense, specialDefense) &&
            const DeepCollectionEquality().equals(other.speed, speed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hp),
      const DeepCollectionEquality().hash(attack),
      const DeepCollectionEquality().hash(defense),
      const DeepCollectionEquality().hash(specialAttack),
      const DeepCollectionEquality().hash(specialDefense),
      const DeepCollectionEquality().hash(speed));

  @JsonKey(ignore: true)
  @override
  _$StatSetCopyWith<_StatSet> get copyWith =>
      __$StatSetCopyWithImpl<_StatSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatSetToJson(this);
  }
}

abstract class _StatSet extends StatSet {
  factory _StatSet(
      {int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed}) = _$_StatSet;
  _StatSet._() : super._();

  factory _StatSet.fromJson(Map<String, dynamic> json) = _$_StatSet.fromJson;

  @override
  int get hp;
  @override
  int get attack;
  @override
  int get defense;
  @override
  int get specialAttack;
  @override
  int get specialDefense;
  @override
  int get speed;
  @override
  @JsonKey(ignore: true)
  _$StatSetCopyWith<_StatSet> get copyWith =>
      throw _privateConstructorUsedError;
}
