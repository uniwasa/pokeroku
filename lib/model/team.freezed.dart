// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

  _Team call(
      {@JsonKey(ignore: true)
          String? id,
      String? name,
      @JsonKey(ignore: true)
          List<Build>? builds,
      @JsonKey(includeIfNull: false)
      @DocumentReferenceConverter()
          DocumentReference<Map<String, dynamic>>? ref,
      @TimestampConverter()
          DateTime? createdAt,
      @UpdatedTimestampConverter()
          DateTime? updatedAt}) {
    return _Team(
      id: id,
      name: name,
      builds: builds,
      ref: ref,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Team fromJson(Map<String, Object?> json) {
    return Team.fromJson(json);
  }
}

/// @nodoc
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Build>? get builds => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  @DocumentReferenceConverter()
  DocumentReference<Map<String, dynamic>>? get ref =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @UpdatedTimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      String? name,
      @JsonKey(ignore: true)
          List<Build>? builds,
      @JsonKey(includeIfNull: false)
      @DocumentReferenceConverter()
          DocumentReference<Map<String, dynamic>>? ref,
      @TimestampConverter()
          DateTime? createdAt,
      @UpdatedTimestampConverter()
          DateTime? updatedAt});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? builds = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      builds: builds == freezed
          ? _value.builds
          : builds // ignore: cast_nullable_to_non_nullable
              as List<Build>?,
      ref: ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>?,
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
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      String? name,
      @JsonKey(ignore: true)
          List<Build>? builds,
      @JsonKey(includeIfNull: false)
      @DocumentReferenceConverter()
          DocumentReference<Map<String, dynamic>>? ref,
      @TimestampConverter()
          DateTime? createdAt,
      @UpdatedTimestampConverter()
          DateTime? updatedAt});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? builds = freezed,
    Object? ref = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      builds: builds == freezed
          ? _value.builds
          : builds // ignore: cast_nullable_to_non_nullable
              as List<Build>?,
      ref: ref == freezed
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>?,
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
class _$_Team extends _Team with DiagnosticableTreeMixin {
  _$_Team(
      {@JsonKey(ignore: true) this.id,
      this.name,
      @JsonKey(ignore: true) this.builds,
      @JsonKey(includeIfNull: false) @DocumentReferenceConverter() this.ref,
      @TimestampConverter() this.createdAt,
      @UpdatedTimestampConverter() this.updatedAt})
      : super._();

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(ignore: true)
  final List<Build>? builds;
  @override
  @JsonKey(includeIfNull: false)
  @DocumentReferenceConverter()
  final DocumentReference<Map<String, dynamic>>? ref;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @UpdatedTimestampConverter()
  final DateTime? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Team(id: $id, name: $name, builds: $builds, ref: $ref, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Team'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('builds', builds))
      ..add(DiagnosticsProperty('ref', ref))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.builds, builds) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(builds),
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(this);
  }
}

abstract class _Team extends Team {
  factory _Team(
      {@JsonKey(ignore: true)
          String? id,
      String? name,
      @JsonKey(ignore: true)
          List<Build>? builds,
      @JsonKey(includeIfNull: false)
      @DocumentReferenceConverter()
          DocumentReference<Map<String, dynamic>>? ref,
      @TimestampConverter()
          DateTime? createdAt,
      @UpdatedTimestampConverter()
          DateTime? updatedAt}) = _$_Team;
  _Team._() : super._();

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  List<Build>? get builds;
  @override
  @JsonKey(includeIfNull: false)
  @DocumentReferenceConverter()
  DocumentReference<Map<String, dynamic>>? get ref;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @UpdatedTimestampConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$TeamCopyWith<_Team> get copyWith => throw _privateConstructorUsedError;
}
