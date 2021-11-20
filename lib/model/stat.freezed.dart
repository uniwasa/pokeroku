// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stat _$StatFromJson(Map<String, dynamic> json) {
  return _Stat.fromJson(json);
}

/// @nodoc
class _$StatTearOff {
  const _$StatTearOff();

  _Stat call(
      {int hp = 0,
      int attack = 0,
      int defense = 0,
      int specialAttack = 0,
      int specialDefense = 0,
      int speed = 0}) {
    return _Stat(
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
  }

  Stat fromJson(Map<String, Object> json) {
    return Stat.fromJson(json);
  }
}

/// @nodoc
const $Stat = _$StatTearOff();

/// @nodoc
mixin _$Stat {
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get specialAttack => throw _privateConstructorUsedError;
  int get specialDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatCopyWith<Stat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatCopyWith<$Res> {
  factory $StatCopyWith(Stat value, $Res Function(Stat) then) =
      _$StatCopyWithImpl<$Res>;
  $Res call(
      {int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed});
}

/// @nodoc
class _$StatCopyWithImpl<$Res> implements $StatCopyWith<$Res> {
  _$StatCopyWithImpl(this._value, this._then);

  final Stat _value;
  // ignore: unused_field
  final $Res Function(Stat) _then;

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
abstract class _$StatCopyWith<$Res> implements $StatCopyWith<$Res> {
  factory _$StatCopyWith(_Stat value, $Res Function(_Stat) then) =
      __$StatCopyWithImpl<$Res>;
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
class __$StatCopyWithImpl<$Res> extends _$StatCopyWithImpl<$Res>
    implements _$StatCopyWith<$Res> {
  __$StatCopyWithImpl(_Stat _value, $Res Function(_Stat) _then)
      : super(_value, (v) => _then(v as _Stat));

  @override
  _Stat get _value => super._value as _Stat;

  @override
  $Res call({
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
  }) {
    return _then(_Stat(
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
class _$_Stat extends _Stat with DiagnosticableTreeMixin {
  _$_Stat(
      {this.hp = 0,
      this.attack = 0,
      this.defense = 0,
      this.specialAttack = 0,
      this.specialDefense = 0,
      this.speed = 0})
      : super._();

  factory _$_Stat.fromJson(Map<String, dynamic> json) =>
      _$_$_StatFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int hp;
  @JsonKey(defaultValue: 0)
  @override
  final int attack;
  @JsonKey(defaultValue: 0)
  @override
  final int defense;
  @JsonKey(defaultValue: 0)
  @override
  final int specialAttack;
  @JsonKey(defaultValue: 0)
  @override
  final int specialDefense;
  @JsonKey(defaultValue: 0)
  @override
  final int speed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Stat(hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Stat'))
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
        (other is _Stat &&
            (identical(other.hp, hp) ||
                const DeepCollectionEquality().equals(other.hp, hp)) &&
            (identical(other.attack, attack) ||
                const DeepCollectionEquality().equals(other.attack, attack)) &&
            (identical(other.defense, defense) ||
                const DeepCollectionEquality()
                    .equals(other.defense, defense)) &&
            (identical(other.specialAttack, specialAttack) ||
                const DeepCollectionEquality()
                    .equals(other.specialAttack, specialAttack)) &&
            (identical(other.specialDefense, specialDefense) ||
                const DeepCollectionEquality()
                    .equals(other.specialDefense, specialDefense)) &&
            (identical(other.speed, speed) ||
                const DeepCollectionEquality().equals(other.speed, speed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hp) ^
      const DeepCollectionEquality().hash(attack) ^
      const DeepCollectionEquality().hash(defense) ^
      const DeepCollectionEquality().hash(specialAttack) ^
      const DeepCollectionEquality().hash(specialDefense) ^
      const DeepCollectionEquality().hash(speed);

  @JsonKey(ignore: true)
  @override
  _$StatCopyWith<_Stat> get copyWith =>
      __$StatCopyWithImpl<_Stat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatToJson(this);
  }
}

abstract class _Stat extends Stat {
  factory _Stat(
      {int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed}) = _$_Stat;
  _Stat._() : super._();

  factory _Stat.fromJson(Map<String, dynamic> json) = _$_Stat.fromJson;

  @override
  int get hp => throw _privateConstructorUsedError;
  @override
  int get attack => throw _privateConstructorUsedError;
  @override
  int get defense => throw _privateConstructorUsedError;
  @override
  int get specialAttack => throw _privateConstructorUsedError;
  @override
  int get specialDefense => throw _privateConstructorUsedError;
  @override
  int get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatCopyWith<_Stat> get copyWith => throw _privateConstructorUsedError;
}
