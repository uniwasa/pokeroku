// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'build.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Build _$BuildFromJson(Map<String, dynamic> json) {
  return _Build.fromJson(json);
}

/// @nodoc
class _$BuildTearOff {
  const _$BuildTearOff();

  _Build call(
      {@JsonKey(ignore: true) String? id,
      required int pokemonId,
      int? abilityId,
      int? natureId,
      int? itemId,
      int? level,
      StatSet? individualValues,
      StatSet? effortValues,
      @JsonKey(fromJson: _fromMoves) List<int?>? moves,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt}) {
    return _Build(
      id: id,
      pokemonId: pokemonId,
      abilityId: abilityId,
      natureId: natureId,
      itemId: itemId,
      level: level,
      individualValues: individualValues,
      effortValues: effortValues,
      moves: moves,
      team: team,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Build fromJson(Map<String, Object?> json) {
    return Build.fromJson(json);
  }
}

/// @nodoc
const $Build = _$BuildTearOff();

/// @nodoc
mixin _$Build {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  int get pokemonId => throw _privateConstructorUsedError;
  int? get abilityId => throw _privateConstructorUsedError;
  int? get natureId => throw _privateConstructorUsedError;
  int? get itemId => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  StatSet? get individualValues => throw _privateConstructorUsedError;
  StatSet? get effortValues => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromMoves)
  List<int?>? get moves => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Team? get team => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildCopyWith<Build> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildCopyWith<$Res> {
  factory $BuildCopyWith(Build value, $Res Function(Build) then) =
      _$BuildCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      int pokemonId,
      int? abilityId,
      int? natureId,
      int? itemId,
      int? level,
      StatSet? individualValues,
      StatSet? effortValues,
      @JsonKey(fromJson: _fromMoves) List<int?>? moves,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt});

  $StatSetCopyWith<$Res>? get individualValues;
  $StatSetCopyWith<$Res>? get effortValues;
  $TeamCopyWith<$Res>? get team;
}

/// @nodoc
class _$BuildCopyWithImpl<$Res> implements $BuildCopyWith<$Res> {
  _$BuildCopyWithImpl(this._value, this._then);

  final Build _value;
  // ignore: unused_field
  final $Res Function(Build) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pokemonId = freezed,
    Object? abilityId = freezed,
    Object? natureId = freezed,
    Object? itemId = freezed,
    Object? level = freezed,
    Object? individualValues = freezed,
    Object? effortValues = freezed,
    Object? moves = freezed,
    Object? team = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonId: pokemonId == freezed
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
      abilityId: abilityId == freezed
          ? _value.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      natureId: natureId == freezed
          ? _value.natureId
          : natureId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      individualValues: individualValues == freezed
          ? _value.individualValues
          : individualValues // ignore: cast_nullable_to_non_nullable
              as StatSet?,
      effortValues: effortValues == freezed
          ? _value.effortValues
          : effortValues // ignore: cast_nullable_to_non_nullable
              as StatSet?,
      moves: moves == freezed
          ? _value.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $StatSetCopyWith<$Res>? get individualValues {
    if (_value.individualValues == null) {
      return null;
    }

    return $StatSetCopyWith<$Res>(_value.individualValues!, (value) {
      return _then(_value.copyWith(individualValues: value));
    });
  }

  @override
  $StatSetCopyWith<$Res>? get effortValues {
    if (_value.effortValues == null) {
      return null;
    }

    return $StatSetCopyWith<$Res>(_value.effortValues!, (value) {
      return _then(_value.copyWith(effortValues: value));
    });
  }

  @override
  $TeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc
abstract class _$BuildCopyWith<$Res> implements $BuildCopyWith<$Res> {
  factory _$BuildCopyWith(_Build value, $Res Function(_Build) then) =
      __$BuildCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      int pokemonId,
      int? abilityId,
      int? natureId,
      int? itemId,
      int? level,
      StatSet? individualValues,
      StatSet? effortValues,
      @JsonKey(fromJson: _fromMoves) List<int?>? moves,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt});

  @override
  $StatSetCopyWith<$Res>? get individualValues;
  @override
  $StatSetCopyWith<$Res>? get effortValues;
  @override
  $TeamCopyWith<$Res>? get team;
}

/// @nodoc
class __$BuildCopyWithImpl<$Res> extends _$BuildCopyWithImpl<$Res>
    implements _$BuildCopyWith<$Res> {
  __$BuildCopyWithImpl(_Build _value, $Res Function(_Build) _then)
      : super(_value, (v) => _then(v as _Build));

  @override
  _Build get _value => super._value as _Build;

  @override
  $Res call({
    Object? id = freezed,
    Object? pokemonId = freezed,
    Object? abilityId = freezed,
    Object? natureId = freezed,
    Object? itemId = freezed,
    Object? level = freezed,
    Object? individualValues = freezed,
    Object? effortValues = freezed,
    Object? moves = freezed,
    Object? team = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Build(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      pokemonId: pokemonId == freezed
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as int,
      abilityId: abilityId == freezed
          ? _value.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      natureId: natureId == freezed
          ? _value.natureId
          : natureId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      individualValues: individualValues == freezed
          ? _value.individualValues
          : individualValues // ignore: cast_nullable_to_non_nullable
              as StatSet?,
      effortValues: effortValues == freezed
          ? _value.effortValues
          : effortValues // ignore: cast_nullable_to_non_nullable
              as StatSet?,
      moves: moves == freezed
          ? _value.moves
          : moves // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Build extends _Build with DiagnosticableTreeMixin {
  _$_Build(
      {@JsonKey(ignore: true) this.id,
      required this.pokemonId,
      this.abilityId,
      this.natureId,
      this.itemId,
      this.level,
      this.individualValues,
      this.effortValues,
      @JsonKey(fromJson: _fromMoves) this.moves,
      @JsonKey(ignore: true) this.team,
      @TimestampConverter() this.createdAt,
      @UpdatedTimestampConverter() this.updatedAt})
      : super._();

  factory _$_Build.fromJson(Map<String, dynamic> json) =>
      _$$_BuildFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final int pokemonId;
  @override
  final int? abilityId;
  @override
  final int? natureId;
  @override
  final int? itemId;
  @override
  final int? level;
  @override
  final StatSet? individualValues;
  @override
  final StatSet? effortValues;
  @override
  @JsonKey(fromJson: _fromMoves)
  final List<int?>? moves;
  @override
  @JsonKey(ignore: true)
  final Team? team;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @UpdatedTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Build(id: $id, pokemonId: $pokemonId, abilityId: $abilityId, natureId: $natureId, itemId: $itemId, level: $level, individualValues: $individualValues, effortValues: $effortValues, moves: $moves, team: $team, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Build'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('pokemonId', pokemonId))
      ..add(DiagnosticsProperty('abilityId', abilityId))
      ..add(DiagnosticsProperty('natureId', natureId))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('individualValues', individualValues))
      ..add(DiagnosticsProperty('effortValues', effortValues))
      ..add(DiagnosticsProperty('moves', moves))
      ..add(DiagnosticsProperty('team', team))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Build &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.pokemonId, pokemonId) &&
            const DeepCollectionEquality().equals(other.abilityId, abilityId) &&
            const DeepCollectionEquality().equals(other.natureId, natureId) &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality()
                .equals(other.individualValues, individualValues) &&
            const DeepCollectionEquality()
                .equals(other.effortValues, effortValues) &&
            const DeepCollectionEquality().equals(other.moves, moves) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(pokemonId),
      const DeepCollectionEquality().hash(abilityId),
      const DeepCollectionEquality().hash(natureId),
      const DeepCollectionEquality().hash(itemId),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(individualValues),
      const DeepCollectionEquality().hash(effortValues),
      const DeepCollectionEquality().hash(moves),
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$BuildCopyWith<_Build> get copyWith =>
      __$BuildCopyWithImpl<_Build>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuildToJson(this);
  }
}

abstract class _Build extends Build {
  factory _Build(
      {@JsonKey(ignore: true) String? id,
      required int pokemonId,
      int? abilityId,
      int? natureId,
      int? itemId,
      int? level,
      StatSet? individualValues,
      StatSet? effortValues,
      @JsonKey(fromJson: _fromMoves) List<int?>? moves,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt}) = _$_Build;
  _Build._() : super._();

  factory _Build.fromJson(Map<String, dynamic> json) = _$_Build.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  int get pokemonId;
  @override
  int? get abilityId;
  @override
  int? get natureId;
  @override
  int? get itemId;
  @override
  int? get level;
  @override
  StatSet? get individualValues;
  @override
  StatSet? get effortValues;
  @override
  @JsonKey(fromJson: _fromMoves)
  List<int?>? get moves;
  @override
  @JsonKey(ignore: true)
  Team? get team;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @UpdatedTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$BuildCopyWith<_Build> get copyWith => throw _privateConstructorUsedError;
}
