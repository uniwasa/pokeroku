// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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
      int? itemId,
      Map<String, int>? individualValues,
      Map<String, int>? effortValues,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt}) {
    return _Build(
      id: id,
      pokemonId: pokemonId,
      itemId: itemId,
      individualValues: individualValues,
      effortValues: effortValues,
      team: team,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Build fromJson(Map<String, Object> json) {
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
  int? get itemId => throw _privateConstructorUsedError;
  Map<String, int>? get individualValues => throw _privateConstructorUsedError;
  Map<String, int>? get effortValues => throw _privateConstructorUsedError;
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
      int? itemId,
      Map<String, int>? individualValues,
      Map<String, int>? effortValues,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt});

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
    Object? itemId = freezed,
    Object? individualValues = freezed,
    Object? effortValues = freezed,
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
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      individualValues: individualValues == freezed
          ? _value.individualValues
          : individualValues // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      effortValues: effortValues == freezed
          ? _value.effortValues
          : effortValues // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
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
      int? itemId,
      Map<String, int>? individualValues,
      Map<String, int>? effortValues,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt});

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
    Object? itemId = freezed,
    Object? individualValues = freezed,
    Object? effortValues = freezed,
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
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      individualValues: individualValues == freezed
          ? _value.individualValues
          : individualValues // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      effortValues: effortValues == freezed
          ? _value.effortValues
          : effortValues // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
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
@JsonSerializable()
class _$_Build extends _Build with DiagnosticableTreeMixin {
  _$_Build(
      {@JsonKey(ignore: true) this.id,
      required this.pokemonId,
      this.itemId,
      this.individualValues,
      this.effortValues,
      @JsonKey(ignore: true) this.team,
      @TimestampConverter() this.createdAt,
      @UpdatedTimestampConverter() this.updatedAt})
      : super._();

  factory _$_Build.fromJson(Map<String, dynamic> json) =>
      _$_$_BuildFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final int pokemonId;
  @override
  final int? itemId;
  @override
  final Map<String, int>? individualValues;
  @override
  final Map<String, int>? effortValues;
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
    return 'Build(id: $id, pokemonId: $pokemonId, itemId: $itemId, individualValues: $individualValues, effortValues: $effortValues, team: $team, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Build'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('pokemonId', pokemonId))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('individualValues', individualValues))
      ..add(DiagnosticsProperty('effortValues', effortValues))
      ..add(DiagnosticsProperty('team', team))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Build &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.pokemonId, pokemonId) ||
                const DeepCollectionEquality()
                    .equals(other.pokemonId, pokemonId)) &&
            (identical(other.itemId, itemId) ||
                const DeepCollectionEquality().equals(other.itemId, itemId)) &&
            (identical(other.individualValues, individualValues) ||
                const DeepCollectionEquality()
                    .equals(other.individualValues, individualValues)) &&
            (identical(other.effortValues, effortValues) ||
                const DeepCollectionEquality()
                    .equals(other.effortValues, effortValues)) &&
            (identical(other.team, team) ||
                const DeepCollectionEquality().equals(other.team, team)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(pokemonId) ^
      const DeepCollectionEquality().hash(itemId) ^
      const DeepCollectionEquality().hash(individualValues) ^
      const DeepCollectionEquality().hash(effortValues) ^
      const DeepCollectionEquality().hash(team) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$BuildCopyWith<_Build> get copyWith =>
      __$BuildCopyWithImpl<_Build>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BuildToJson(this);
  }
}

abstract class _Build extends Build {
  factory _Build(
      {@JsonKey(ignore: true) String? id,
      required int pokemonId,
      int? itemId,
      Map<String, int>? individualValues,
      Map<String, int>? effortValues,
      @JsonKey(ignore: true) Team? team,
      @TimestampConverter() DateTime? createdAt,
      @UpdatedTimestampConverter() DateTime? updatedAt}) = _$_Build;
  _Build._() : super._();

  factory _Build.fromJson(Map<String, dynamic> json) = _$_Build.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  int get pokemonId => throw _privateConstructorUsedError;
  @override
  int? get itemId => throw _privateConstructorUsedError;
  @override
  Map<String, int>? get individualValues => throw _privateConstructorUsedError;
  @override
  Map<String, int>? get effortValues => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  Team? get team => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @UpdatedTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildCopyWith<_Build> get copyWith => throw _privateConstructorUsedError;
}
