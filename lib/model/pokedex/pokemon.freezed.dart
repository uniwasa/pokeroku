// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
class _$PokemonTearOff {
  const _$PokemonTearOff();

  _Pokemon call(
      {required int id,
      required String identifier,
      @JsonKey(name: 'species_identifier')
          required String speciesIdentifier,
      @JsonKey(name: 'name_jp')
          required String nameJp,
      @JsonKey(name: 'first_type')
          required int firstType,
      @JsonKey(name: 'second_type')
          int? secondType,
      @JsonKey(name: 'first_type_identifier')
          required String firstTypeIdentifier,
      @JsonKey(name: 'second_type_identifier')
          String? secondTypeIdentifier,
      @JsonKey(name: 'first_type_name')
          required String firstTypeName,
      @JsonKey(name: 'second_type_name')
          String? secondTypeName,
      required int hp,
      required int attack,
      required int defense,
      @JsonKey(name: 'special_attack')
          required int specialAttack,
      @JsonKey(name: 'special_defense')
          required int specialDefense,
      required int speed}) {
    return _Pokemon(
      id: id,
      identifier: identifier,
      speciesIdentifier: speciesIdentifier,
      nameJp: nameJp,
      firstType: firstType,
      secondType: secondType,
      firstTypeIdentifier: firstTypeIdentifier,
      secondTypeIdentifier: secondTypeIdentifier,
      firstTypeName: firstTypeName,
      secondTypeName: secondTypeName,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
    );
  }

  Pokemon fromJson(Map<String, Object> json) {
    return Pokemon.fromJson(json);
  }
}

/// @nodoc
const $Pokemon = _$PokemonTearOff();

/// @nodoc
mixin _$Pokemon {
  int get id => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'species_identifier')
  String get speciesIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_jp')
  String get nameJp => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_type')
  int get firstType => throw _privateConstructorUsedError;
  @JsonKey(name: 'second_type')
  int? get secondType => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_type_identifier')
  String get firstTypeIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'second_type_identifier')
  String? get secondTypeIdentifier => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_type_name')
  String get firstTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'second_type_name')
  String? get secondTypeName => throw _privateConstructorUsedError;
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  @JsonKey(name: 'special_attack')
  int get specialAttack => throw _privateConstructorUsedError;
  @JsonKey(name: 'special_defense')
  int get specialDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String identifier,
      @JsonKey(name: 'species_identifier') String speciesIdentifier,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'first_type') int firstType,
      @JsonKey(name: 'second_type') int? secondType,
      @JsonKey(name: 'first_type_identifier') String firstTypeIdentifier,
      @JsonKey(name: 'second_type_identifier') String? secondTypeIdentifier,
      @JsonKey(name: 'first_type_name') String firstTypeName,
      @JsonKey(name: 'second_type_name') String? secondTypeName,
      int hp,
      int attack,
      int defense,
      @JsonKey(name: 'special_attack') int specialAttack,
      @JsonKey(name: 'special_defense') int specialDefense,
      int speed});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res> implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  final Pokemon _value;
  // ignore: unused_field
  final $Res Function(Pokemon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? speciesIdentifier = freezed,
    Object? nameJp = freezed,
    Object? firstType = freezed,
    Object? secondType = freezed,
    Object? firstTypeIdentifier = freezed,
    Object? secondTypeIdentifier = freezed,
    Object? firstTypeName = freezed,
    Object? secondTypeName = freezed,
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
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
      speciesIdentifier: speciesIdentifier == freezed
          ? _value.speciesIdentifier
          : speciesIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      firstType: firstType == freezed
          ? _value.firstType
          : firstType // ignore: cast_nullable_to_non_nullable
              as int,
      secondType: secondType == freezed
          ? _value.secondType
          : secondType // ignore: cast_nullable_to_non_nullable
              as int?,
      firstTypeIdentifier: firstTypeIdentifier == freezed
          ? _value.firstTypeIdentifier
          : firstTypeIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      secondTypeIdentifier: secondTypeIdentifier == freezed
          ? _value.secondTypeIdentifier
          : secondTypeIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      firstTypeName: firstTypeName == freezed
          ? _value.firstTypeName
          : firstTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      secondTypeName: secondTypeName == freezed
          ? _value.secondTypeName
          : secondTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$PokemonCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$PokemonCopyWith(_Pokemon value, $Res Function(_Pokemon) then) =
      __$PokemonCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String identifier,
      @JsonKey(name: 'species_identifier') String speciesIdentifier,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'first_type') int firstType,
      @JsonKey(name: 'second_type') int? secondType,
      @JsonKey(name: 'first_type_identifier') String firstTypeIdentifier,
      @JsonKey(name: 'second_type_identifier') String? secondTypeIdentifier,
      @JsonKey(name: 'first_type_name') String firstTypeName,
      @JsonKey(name: 'second_type_name') String? secondTypeName,
      int hp,
      int attack,
      int defense,
      @JsonKey(name: 'special_attack') int specialAttack,
      @JsonKey(name: 'special_defense') int specialDefense,
      int speed});
}

/// @nodoc
class __$PokemonCopyWithImpl<$Res> extends _$PokemonCopyWithImpl<$Res>
    implements _$PokemonCopyWith<$Res> {
  __$PokemonCopyWithImpl(_Pokemon _value, $Res Function(_Pokemon) _then)
      : super(_value, (v) => _then(v as _Pokemon));

  @override
  _Pokemon get _value => super._value as _Pokemon;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? speciesIdentifier = freezed,
    Object? nameJp = freezed,
    Object? firstType = freezed,
    Object? secondType = freezed,
    Object? firstTypeIdentifier = freezed,
    Object? secondTypeIdentifier = freezed,
    Object? firstTypeName = freezed,
    Object? secondTypeName = freezed,
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
  }) {
    return _then(_Pokemon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      speciesIdentifier: speciesIdentifier == freezed
          ? _value.speciesIdentifier
          : speciesIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      firstType: firstType == freezed
          ? _value.firstType
          : firstType // ignore: cast_nullable_to_non_nullable
              as int,
      secondType: secondType == freezed
          ? _value.secondType
          : secondType // ignore: cast_nullable_to_non_nullable
              as int?,
      firstTypeIdentifier: firstTypeIdentifier == freezed
          ? _value.firstTypeIdentifier
          : firstTypeIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      secondTypeIdentifier: secondTypeIdentifier == freezed
          ? _value.secondTypeIdentifier
          : secondTypeIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      firstTypeName: firstTypeName == freezed
          ? _value.firstTypeName
          : firstTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      secondTypeName: secondTypeName == freezed
          ? _value.secondTypeName
          : secondTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
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

@JsonSerializable()

/// @nodoc
class _$_Pokemon extends _Pokemon {
  const _$_Pokemon(
      {required this.id,
      required this.identifier,
      @JsonKey(name: 'species_identifier') required this.speciesIdentifier,
      @JsonKey(name: 'name_jp') required this.nameJp,
      @JsonKey(name: 'first_type') required this.firstType,
      @JsonKey(name: 'second_type') this.secondType,
      @JsonKey(name: 'first_type_identifier') required this.firstTypeIdentifier,
      @JsonKey(name: 'second_type_identifier') this.secondTypeIdentifier,
      @JsonKey(name: 'first_type_name') required this.firstTypeName,
      @JsonKey(name: 'second_type_name') this.secondTypeName,
      required this.hp,
      required this.attack,
      required this.defense,
      @JsonKey(name: 'special_attack') required this.specialAttack,
      @JsonKey(name: 'special_defense') required this.specialDefense,
      required this.speed})
      : super._();

  factory _$_Pokemon.fromJson(Map<String, dynamic> json) =>
      _$_$_PokemonFromJson(json);

  @override
  final int id;
  @override
  final String identifier;
  @override
  @JsonKey(name: 'species_identifier')
  final String speciesIdentifier;
  @override
  @JsonKey(name: 'name_jp')
  final String nameJp;
  @override
  @JsonKey(name: 'first_type')
  final int firstType;
  @override
  @JsonKey(name: 'second_type')
  final int? secondType;
  @override
  @JsonKey(name: 'first_type_identifier')
  final String firstTypeIdentifier;
  @override
  @JsonKey(name: 'second_type_identifier')
  final String? secondTypeIdentifier;
  @override
  @JsonKey(name: 'first_type_name')
  final String firstTypeName;
  @override
  @JsonKey(name: 'second_type_name')
  final String? secondTypeName;
  @override
  final int hp;
  @override
  final int attack;
  @override
  final int defense;
  @override
  @JsonKey(name: 'special_attack')
  final int specialAttack;
  @override
  @JsonKey(name: 'special_defense')
  final int specialDefense;
  @override
  final int speed;

  @override
  String toString() {
    return 'Pokemon(id: $id, identifier: $identifier, speciesIdentifier: $speciesIdentifier, nameJp: $nameJp, firstType: $firstType, secondType: $secondType, firstTypeIdentifier: $firstTypeIdentifier, secondTypeIdentifier: $secondTypeIdentifier, firstTypeName: $firstTypeName, secondTypeName: $secondTypeName, hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pokemon &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.speciesIdentifier, speciesIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.speciesIdentifier, speciesIdentifier)) &&
            (identical(other.nameJp, nameJp) ||
                const DeepCollectionEquality().equals(other.nameJp, nameJp)) &&
            (identical(other.firstType, firstType) ||
                const DeepCollectionEquality()
                    .equals(other.firstType, firstType)) &&
            (identical(other.secondType, secondType) ||
                const DeepCollectionEquality()
                    .equals(other.secondType, secondType)) &&
            (identical(other.firstTypeIdentifier, firstTypeIdentifier) ||
                const DeepCollectionEquality()
                    .equals(other.firstTypeIdentifier, firstTypeIdentifier)) &&
            (identical(other.secondTypeIdentifier, secondTypeIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.secondTypeIdentifier, secondTypeIdentifier)) &&
            (identical(other.firstTypeName, firstTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.firstTypeName, firstTypeName)) &&
            (identical(other.secondTypeName, secondTypeName) ||
                const DeepCollectionEquality()
                    .equals(other.secondTypeName, secondTypeName)) &&
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
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(speciesIdentifier) ^
      const DeepCollectionEquality().hash(nameJp) ^
      const DeepCollectionEquality().hash(firstType) ^
      const DeepCollectionEquality().hash(secondType) ^
      const DeepCollectionEquality().hash(firstTypeIdentifier) ^
      const DeepCollectionEquality().hash(secondTypeIdentifier) ^
      const DeepCollectionEquality().hash(firstTypeName) ^
      const DeepCollectionEquality().hash(secondTypeName) ^
      const DeepCollectionEquality().hash(hp) ^
      const DeepCollectionEquality().hash(attack) ^
      const DeepCollectionEquality().hash(defense) ^
      const DeepCollectionEquality().hash(specialAttack) ^
      const DeepCollectionEquality().hash(specialDefense) ^
      const DeepCollectionEquality().hash(speed);

  @JsonKey(ignore: true)
  @override
  _$PokemonCopyWith<_Pokemon> get copyWith =>
      __$PokemonCopyWithImpl<_Pokemon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PokemonToJson(this);
  }
}

abstract class _Pokemon extends Pokemon {
  const factory _Pokemon(
      {required int id,
      required String identifier,
      @JsonKey(name: 'species_identifier')
          required String speciesIdentifier,
      @JsonKey(name: 'name_jp')
          required String nameJp,
      @JsonKey(name: 'first_type')
          required int firstType,
      @JsonKey(name: 'second_type')
          int? secondType,
      @JsonKey(name: 'first_type_identifier')
          required String firstTypeIdentifier,
      @JsonKey(name: 'second_type_identifier')
          String? secondTypeIdentifier,
      @JsonKey(name: 'first_type_name')
          required String firstTypeName,
      @JsonKey(name: 'second_type_name')
          String? secondTypeName,
      required int hp,
      required int attack,
      required int defense,
      @JsonKey(name: 'special_attack')
          required int specialAttack,
      @JsonKey(name: 'special_defense')
          required int specialDefense,
      required int speed}) = _$_Pokemon;
  const _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$_Pokemon.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get identifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'species_identifier')
  String get speciesIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name_jp')
  String get nameJp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_type')
  int get firstType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'second_type')
  int? get secondType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_type_identifier')
  String get firstTypeIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'second_type_identifier')
  String? get secondTypeIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_type_name')
  String get firstTypeName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'second_type_name')
  String? get secondTypeName => throw _privateConstructorUsedError;
  @override
  int get hp => throw _privateConstructorUsedError;
  @override
  int get attack => throw _privateConstructorUsedError;
  @override
  int get defense => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'special_attack')
  int get specialAttack => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'special_defense')
  int get specialDefense => throw _privateConstructorUsedError;
  @override
  int get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonCopyWith<_Pokemon> get copyWith =>
      throw _privateConstructorUsedError;
}
