// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      @JsonKey(fromJson: makeOneTenth) required double height,
      @JsonKey(fromJson: makeOneTenth) required double weight,
      required int baseExperience,
      required int speciesId,
      required String identifier,
      required String speciesIdentifier,
      required String nameJp,
      required String nameEn,
      required int hp,
      required int attack,
      required int defense,
      required int specialAttack,
      required int specialDefense,
      required int speed,
      @JsonKey(fromJson: intToBool) required bool isDefault,
      String? pokespritePath,
      String? formIdentifier,
      String? formNameJp,
      String? formNameEn,
      int? pokemonMoveVersionGroupId,
      int? pokemonMoveMethodId,
      int? firstTypeId,
      int? secondTypeId,
      @JsonKey(ignore: true) PokemonType? firstType,
      @JsonKey(ignore: true) PokemonType? secondType,
      @JsonKey(fromJson: makeGenderRate) List<double>? genderRate}) {
    return _Pokemon(
      id: id,
      height: height,
      weight: weight,
      baseExperience: baseExperience,
      speciesId: speciesId,
      identifier: identifier,
      speciesIdentifier: speciesIdentifier,
      nameJp: nameJp,
      nameEn: nameEn,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed,
      isDefault: isDefault,
      pokespritePath: pokespritePath,
      formIdentifier: formIdentifier,
      formNameJp: formNameJp,
      formNameEn: formNameEn,
      pokemonMoveVersionGroupId: pokemonMoveVersionGroupId,
      pokemonMoveMethodId: pokemonMoveMethodId,
      firstTypeId: firstTypeId,
      secondTypeId: secondTypeId,
      firstType: firstType,
      secondType: secondType,
      genderRate: genderRate,
    );
  }

  Pokemon fromJson(Map<String, Object?> json) {
    return Pokemon.fromJson(json);
  }
}

/// @nodoc
const $Pokemon = _$PokemonTearOff();

/// @nodoc
mixin _$Pokemon {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: makeOneTenth)
  double get height => throw _privateConstructorUsedError;
  @JsonKey(fromJson: makeOneTenth)
  double get weight => throw _privateConstructorUsedError;
  int get baseExperience => throw _privateConstructorUsedError;
  int get speciesId => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get speciesIdentifier => throw _privateConstructorUsedError;
  String get nameJp => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  int get hp => throw _privateConstructorUsedError;
  int get attack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get specialAttack => throw _privateConstructorUsedError;
  int get specialDefense => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: intToBool)
  bool get isDefault => throw _privateConstructorUsedError;
  String? get pokespritePath => throw _privateConstructorUsedError;
  String? get formIdentifier => throw _privateConstructorUsedError;
  String? get formNameJp => throw _privateConstructorUsedError;
  String? get formNameEn => throw _privateConstructorUsedError;
  int? get pokemonMoveVersionGroupId => throw _privateConstructorUsedError;
  int? get pokemonMoveMethodId => throw _privateConstructorUsedError;
  int? get firstTypeId => throw _privateConstructorUsedError;
  int? get secondTypeId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  PokemonType? get firstType => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  PokemonType? get secondType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: makeGenderRate)
  List<double>? get genderRate => throw _privateConstructorUsedError;

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
      @JsonKey(fromJson: makeOneTenth) double height,
      @JsonKey(fromJson: makeOneTenth) double weight,
      int baseExperience,
      int speciesId,
      String identifier,
      String speciesIdentifier,
      String nameJp,
      String nameEn,
      int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed,
      @JsonKey(fromJson: intToBool) bool isDefault,
      String? pokespritePath,
      String? formIdentifier,
      String? formNameJp,
      String? formNameEn,
      int? pokemonMoveVersionGroupId,
      int? pokemonMoveMethodId,
      int? firstTypeId,
      int? secondTypeId,
      @JsonKey(ignore: true) PokemonType? firstType,
      @JsonKey(ignore: true) PokemonType? secondType,
      @JsonKey(fromJson: makeGenderRate) List<double>? genderRate});

  $PokemonTypeCopyWith<$Res>? get firstType;
  $PokemonTypeCopyWith<$Res>? get secondType;
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
    Object? height = freezed,
    Object? weight = freezed,
    Object? baseExperience = freezed,
    Object? speciesId = freezed,
    Object? identifier = freezed,
    Object? speciesIdentifier = freezed,
    Object? nameJp = freezed,
    Object? nameEn = freezed,
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
    Object? isDefault = freezed,
    Object? pokespritePath = freezed,
    Object? formIdentifier = freezed,
    Object? formNameJp = freezed,
    Object? formNameEn = freezed,
    Object? pokemonMoveVersionGroupId = freezed,
    Object? pokemonMoveMethodId = freezed,
    Object? firstTypeId = freezed,
    Object? secondTypeId = freezed,
    Object? firstType = freezed,
    Object? secondType = freezed,
    Object? genderRate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      baseExperience: baseExperience == freezed
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      speciesId: speciesId == freezed
          ? _value.speciesId
          : speciesId // ignore: cast_nullable_to_non_nullable
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
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
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
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      pokespritePath: pokespritePath == freezed
          ? _value.pokespritePath
          : pokespritePath // ignore: cast_nullable_to_non_nullable
              as String?,
      formIdentifier: formIdentifier == freezed
          ? _value.formIdentifier
          : formIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      formNameJp: formNameJp == freezed
          ? _value.formNameJp
          : formNameJp // ignore: cast_nullable_to_non_nullable
              as String?,
      formNameEn: formNameEn == freezed
          ? _value.formNameEn
          : formNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonMoveVersionGroupId: pokemonMoveVersionGroupId == freezed
          ? _value.pokemonMoveVersionGroupId
          : pokemonMoveVersionGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      pokemonMoveMethodId: pokemonMoveMethodId == freezed
          ? _value.pokemonMoveMethodId
          : pokemonMoveMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstTypeId: firstTypeId == freezed
          ? _value.firstTypeId
          : firstTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      secondTypeId: secondTypeId == freezed
          ? _value.secondTypeId
          : secondTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstType: firstType == freezed
          ? _value.firstType
          : firstType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      secondType: secondType == freezed
          ? _value.secondType
          : secondType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      genderRate: genderRate == freezed
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }

  @override
  $PokemonTypeCopyWith<$Res>? get firstType {
    if (_value.firstType == null) {
      return null;
    }

    return $PokemonTypeCopyWith<$Res>(_value.firstType!, (value) {
      return _then(_value.copyWith(firstType: value));
    });
  }

  @override
  $PokemonTypeCopyWith<$Res>? get secondType {
    if (_value.secondType == null) {
      return null;
    }

    return $PokemonTypeCopyWith<$Res>(_value.secondType!, (value) {
      return _then(_value.copyWith(secondType: value));
    });
  }
}

/// @nodoc
abstract class _$PokemonCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$PokemonCopyWith(_Pokemon value, $Res Function(_Pokemon) then) =
      __$PokemonCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(fromJson: makeOneTenth) double height,
      @JsonKey(fromJson: makeOneTenth) double weight,
      int baseExperience,
      int speciesId,
      String identifier,
      String speciesIdentifier,
      String nameJp,
      String nameEn,
      int hp,
      int attack,
      int defense,
      int specialAttack,
      int specialDefense,
      int speed,
      @JsonKey(fromJson: intToBool) bool isDefault,
      String? pokespritePath,
      String? formIdentifier,
      String? formNameJp,
      String? formNameEn,
      int? pokemonMoveVersionGroupId,
      int? pokemonMoveMethodId,
      int? firstTypeId,
      int? secondTypeId,
      @JsonKey(ignore: true) PokemonType? firstType,
      @JsonKey(ignore: true) PokemonType? secondType,
      @JsonKey(fromJson: makeGenderRate) List<double>? genderRate});

  @override
  $PokemonTypeCopyWith<$Res>? get firstType;
  @override
  $PokemonTypeCopyWith<$Res>? get secondType;
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
    Object? height = freezed,
    Object? weight = freezed,
    Object? baseExperience = freezed,
    Object? speciesId = freezed,
    Object? identifier = freezed,
    Object? speciesIdentifier = freezed,
    Object? nameJp = freezed,
    Object? nameEn = freezed,
    Object? hp = freezed,
    Object? attack = freezed,
    Object? defense = freezed,
    Object? specialAttack = freezed,
    Object? specialDefense = freezed,
    Object? speed = freezed,
    Object? isDefault = freezed,
    Object? pokespritePath = freezed,
    Object? formIdentifier = freezed,
    Object? formNameJp = freezed,
    Object? formNameEn = freezed,
    Object? pokemonMoveVersionGroupId = freezed,
    Object? pokemonMoveMethodId = freezed,
    Object? firstTypeId = freezed,
    Object? secondTypeId = freezed,
    Object? firstType = freezed,
    Object? secondType = freezed,
    Object? genderRate = freezed,
  }) {
    return _then(_Pokemon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      baseExperience: baseExperience == freezed
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      speciesId: speciesId == freezed
          ? _value.speciesId
          : speciesId // ignore: cast_nullable_to_non_nullable
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
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
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
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      pokespritePath: pokespritePath == freezed
          ? _value.pokespritePath
          : pokespritePath // ignore: cast_nullable_to_non_nullable
              as String?,
      formIdentifier: formIdentifier == freezed
          ? _value.formIdentifier
          : formIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      formNameJp: formNameJp == freezed
          ? _value.formNameJp
          : formNameJp // ignore: cast_nullable_to_non_nullable
              as String?,
      formNameEn: formNameEn == freezed
          ? _value.formNameEn
          : formNameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonMoveVersionGroupId: pokemonMoveVersionGroupId == freezed
          ? _value.pokemonMoveVersionGroupId
          : pokemonMoveVersionGroupId // ignore: cast_nullable_to_non_nullable
              as int?,
      pokemonMoveMethodId: pokemonMoveMethodId == freezed
          ? _value.pokemonMoveMethodId
          : pokemonMoveMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstTypeId: firstTypeId == freezed
          ? _value.firstTypeId
          : firstTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      secondTypeId: secondTypeId == freezed
          ? _value.secondTypeId
          : secondTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstType: firstType == freezed
          ? _value.firstType
          : firstType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      secondType: secondType == freezed
          ? _value.secondType
          : secondType // ignore: cast_nullable_to_non_nullable
              as PokemonType?,
      genderRate: genderRate == freezed
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Pokemon extends _Pokemon with DiagnosticableTreeMixin {
  const _$_Pokemon(
      {required this.id,
      @JsonKey(fromJson: makeOneTenth) required this.height,
      @JsonKey(fromJson: makeOneTenth) required this.weight,
      required this.baseExperience,
      required this.speciesId,
      required this.identifier,
      required this.speciesIdentifier,
      required this.nameJp,
      required this.nameEn,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.specialAttack,
      required this.specialDefense,
      required this.speed,
      @JsonKey(fromJson: intToBool) required this.isDefault,
      this.pokespritePath,
      this.formIdentifier,
      this.formNameJp,
      this.formNameEn,
      this.pokemonMoveVersionGroupId,
      this.pokemonMoveMethodId,
      this.firstTypeId,
      this.secondTypeId,
      @JsonKey(ignore: true) this.firstType,
      @JsonKey(ignore: true) this.secondType,
      @JsonKey(fromJson: makeGenderRate) this.genderRate})
      : super._();

  factory _$_Pokemon.fromJson(Map<String, dynamic> json) =>
      _$$_PokemonFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: makeOneTenth)
  final double height;
  @override
  @JsonKey(fromJson: makeOneTenth)
  final double weight;
  @override
  final int baseExperience;
  @override
  final int speciesId;
  @override
  final String identifier;
  @override
  final String speciesIdentifier;
  @override
  final String nameJp;
  @override
  final String nameEn;
  @override
  final int hp;
  @override
  final int attack;
  @override
  final int defense;
  @override
  final int specialAttack;
  @override
  final int specialDefense;
  @override
  final int speed;
  @override
  @JsonKey(fromJson: intToBool)
  final bool isDefault;
  @override
  final String? pokespritePath;
  @override
  final String? formIdentifier;
  @override
  final String? formNameJp;
  @override
  final String? formNameEn;
  @override
  final int? pokemonMoveVersionGroupId;
  @override
  final int? pokemonMoveMethodId;
  @override
  final int? firstTypeId;
  @override
  final int? secondTypeId;
  @override
  @JsonKey(ignore: true)
  final PokemonType? firstType;
  @override
  @JsonKey(ignore: true)
  final PokemonType? secondType;
  @override
  @JsonKey(fromJson: makeGenderRate)
  final List<double>? genderRate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pokemon(id: $id, height: $height, weight: $weight, baseExperience: $baseExperience, speciesId: $speciesId, identifier: $identifier, speciesIdentifier: $speciesIdentifier, nameJp: $nameJp, nameEn: $nameEn, hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed, isDefault: $isDefault, pokespritePath: $pokespritePath, formIdentifier: $formIdentifier, formNameJp: $formNameJp, formNameEn: $formNameEn, pokemonMoveVersionGroupId: $pokemonMoveVersionGroupId, pokemonMoveMethodId: $pokemonMoveMethodId, firstTypeId: $firstTypeId, secondTypeId: $secondTypeId, firstType: $firstType, secondType: $secondType, genderRate: $genderRate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pokemon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('baseExperience', baseExperience))
      ..add(DiagnosticsProperty('speciesId', speciesId))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('speciesIdentifier', speciesIdentifier))
      ..add(DiagnosticsProperty('nameJp', nameJp))
      ..add(DiagnosticsProperty('nameEn', nameEn))
      ..add(DiagnosticsProperty('hp', hp))
      ..add(DiagnosticsProperty('attack', attack))
      ..add(DiagnosticsProperty('defense', defense))
      ..add(DiagnosticsProperty('specialAttack', specialAttack))
      ..add(DiagnosticsProperty('specialDefense', specialDefense))
      ..add(DiagnosticsProperty('speed', speed))
      ..add(DiagnosticsProperty('isDefault', isDefault))
      ..add(DiagnosticsProperty('pokespritePath', pokespritePath))
      ..add(DiagnosticsProperty('formIdentifier', formIdentifier))
      ..add(DiagnosticsProperty('formNameJp', formNameJp))
      ..add(DiagnosticsProperty('formNameEn', formNameEn))
      ..add(DiagnosticsProperty(
          'pokemonMoveVersionGroupId', pokemonMoveVersionGroupId))
      ..add(DiagnosticsProperty('pokemonMoveMethodId', pokemonMoveMethodId))
      ..add(DiagnosticsProperty('firstTypeId', firstTypeId))
      ..add(DiagnosticsProperty('secondTypeId', secondTypeId))
      ..add(DiagnosticsProperty('firstType', firstType))
      ..add(DiagnosticsProperty('secondType', secondType))
      ..add(DiagnosticsProperty('genderRate', genderRate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pokemon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality()
                .equals(other.baseExperience, baseExperience) &&
            const DeepCollectionEquality().equals(other.speciesId, speciesId) &&
            const DeepCollectionEquality()
                .equals(other.identifier, identifier) &&
            const DeepCollectionEquality()
                .equals(other.speciesIdentifier, speciesIdentifier) &&
            const DeepCollectionEquality().equals(other.nameJp, nameJp) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.hp, hp) &&
            const DeepCollectionEquality().equals(other.attack, attack) &&
            const DeepCollectionEquality().equals(other.defense, defense) &&
            const DeepCollectionEquality()
                .equals(other.specialAttack, specialAttack) &&
            const DeepCollectionEquality()
                .equals(other.specialDefense, specialDefense) &&
            const DeepCollectionEquality().equals(other.speed, speed) &&
            const DeepCollectionEquality().equals(other.isDefault, isDefault) &&
            const DeepCollectionEquality()
                .equals(other.pokespritePath, pokespritePath) &&
            const DeepCollectionEquality()
                .equals(other.formIdentifier, formIdentifier) &&
            const DeepCollectionEquality()
                .equals(other.formNameJp, formNameJp) &&
            const DeepCollectionEquality()
                .equals(other.formNameEn, formNameEn) &&
            const DeepCollectionEquality().equals(
                other.pokemonMoveVersionGroupId, pokemonMoveVersionGroupId) &&
            const DeepCollectionEquality()
                .equals(other.pokemonMoveMethodId, pokemonMoveMethodId) &&
            const DeepCollectionEquality()
                .equals(other.firstTypeId, firstTypeId) &&
            const DeepCollectionEquality()
                .equals(other.secondTypeId, secondTypeId) &&
            const DeepCollectionEquality().equals(other.firstType, firstType) &&
            const DeepCollectionEquality()
                .equals(other.secondType, secondType) &&
            const DeepCollectionEquality()
                .equals(other.genderRate, genderRate));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(height),
        const DeepCollectionEquality().hash(weight),
        const DeepCollectionEquality().hash(baseExperience),
        const DeepCollectionEquality().hash(speciesId),
        const DeepCollectionEquality().hash(identifier),
        const DeepCollectionEquality().hash(speciesIdentifier),
        const DeepCollectionEquality().hash(nameJp),
        const DeepCollectionEquality().hash(nameEn),
        const DeepCollectionEquality().hash(hp),
        const DeepCollectionEquality().hash(attack),
        const DeepCollectionEquality().hash(defense),
        const DeepCollectionEquality().hash(specialAttack),
        const DeepCollectionEquality().hash(specialDefense),
        const DeepCollectionEquality().hash(speed),
        const DeepCollectionEquality().hash(isDefault),
        const DeepCollectionEquality().hash(pokespritePath),
        const DeepCollectionEquality().hash(formIdentifier),
        const DeepCollectionEquality().hash(formNameJp),
        const DeepCollectionEquality().hash(formNameEn),
        const DeepCollectionEquality().hash(pokemonMoveVersionGroupId),
        const DeepCollectionEquality().hash(pokemonMoveMethodId),
        const DeepCollectionEquality().hash(firstTypeId),
        const DeepCollectionEquality().hash(secondTypeId),
        const DeepCollectionEquality().hash(firstType),
        const DeepCollectionEquality().hash(secondType),
        const DeepCollectionEquality().hash(genderRate)
      ]);

  @JsonKey(ignore: true)
  @override
  _$PokemonCopyWith<_Pokemon> get copyWith =>
      __$PokemonCopyWithImpl<_Pokemon>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokemonToJson(this);
  }
}

abstract class _Pokemon extends Pokemon {
  const factory _Pokemon(
          {required int id,
          @JsonKey(fromJson: makeOneTenth) required double height,
          @JsonKey(fromJson: makeOneTenth) required double weight,
          required int baseExperience,
          required int speciesId,
          required String identifier,
          required String speciesIdentifier,
          required String nameJp,
          required String nameEn,
          required int hp,
          required int attack,
          required int defense,
          required int specialAttack,
          required int specialDefense,
          required int speed,
          @JsonKey(fromJson: intToBool) required bool isDefault,
          String? pokespritePath,
          String? formIdentifier,
          String? formNameJp,
          String? formNameEn,
          int? pokemonMoveVersionGroupId,
          int? pokemonMoveMethodId,
          int? firstTypeId,
          int? secondTypeId,
          @JsonKey(ignore: true) PokemonType? firstType,
          @JsonKey(ignore: true) PokemonType? secondType,
          @JsonKey(fromJson: makeGenderRate) List<double>? genderRate}) =
      _$_Pokemon;
  const _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$_Pokemon.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: makeOneTenth)
  double get height;
  @override
  @JsonKey(fromJson: makeOneTenth)
  double get weight;
  @override
  int get baseExperience;
  @override
  int get speciesId;
  @override
  String get identifier;
  @override
  String get speciesIdentifier;
  @override
  String get nameJp;
  @override
  String get nameEn;
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
  @JsonKey(fromJson: intToBool)
  bool get isDefault;
  @override
  String? get pokespritePath;
  @override
  String? get formIdentifier;
  @override
  String? get formNameJp;
  @override
  String? get formNameEn;
  @override
  int? get pokemonMoveVersionGroupId;
  @override
  int? get pokemonMoveMethodId;
  @override
  int? get firstTypeId;
  @override
  int? get secondTypeId;
  @override
  @JsonKey(ignore: true)
  PokemonType? get firstType;
  @override
  @JsonKey(ignore: true)
  PokemonType? get secondType;
  @override
  @JsonKey(fromJson: makeGenderRate)
  List<double>? get genderRate;
  @override
  @JsonKey(ignore: true)
  _$PokemonCopyWith<_Pokemon> get copyWith =>
      throw _privateConstructorUsedError;
}
