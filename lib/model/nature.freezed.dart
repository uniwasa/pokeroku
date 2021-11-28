// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'nature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Nature _$NatureFromJson(Map<String, dynamic> json) {
  return _Nature.fromJson(json);
}

/// @nodoc
class _$NatureTearOff {
  const _$NatureTearOff();

  _Nature call(
      {required int id,
      required String identifier,
      required String nameJp,
      required String decreasedStatIdentifier,
      required String increasedStatIdentifier}) {
    return _Nature(
      id: id,
      identifier: identifier,
      nameJp: nameJp,
      decreasedStatIdentifier: decreasedStatIdentifier,
      increasedStatIdentifier: increasedStatIdentifier,
    );
  }

  Nature fromJson(Map<String, Object> json) {
    return Nature.fromJson(json);
  }
}

/// @nodoc
const $Nature = _$NatureTearOff();

/// @nodoc
mixin _$Nature {
  int get id => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get nameJp => throw _privateConstructorUsedError;
  String get decreasedStatIdentifier => throw _privateConstructorUsedError;
  String get increasedStatIdentifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NatureCopyWith<Nature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NatureCopyWith<$Res> {
  factory $NatureCopyWith(Nature value, $Res Function(Nature) then) =
      _$NatureCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String identifier,
      String nameJp,
      String decreasedStatIdentifier,
      String increasedStatIdentifier});
}

/// @nodoc
class _$NatureCopyWithImpl<$Res> implements $NatureCopyWith<$Res> {
  _$NatureCopyWithImpl(this._value, this._then);

  final Nature _value;
  // ignore: unused_field
  final $Res Function(Nature) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? nameJp = freezed,
    Object? decreasedStatIdentifier = freezed,
    Object? increasedStatIdentifier = freezed,
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
      decreasedStatIdentifier: decreasedStatIdentifier == freezed
          ? _value.decreasedStatIdentifier
          : decreasedStatIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      increasedStatIdentifier: increasedStatIdentifier == freezed
          ? _value.increasedStatIdentifier
          : increasedStatIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NatureCopyWith<$Res> implements $NatureCopyWith<$Res> {
  factory _$NatureCopyWith(_Nature value, $Res Function(_Nature) then) =
      __$NatureCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String identifier,
      String nameJp,
      String decreasedStatIdentifier,
      String increasedStatIdentifier});
}

/// @nodoc
class __$NatureCopyWithImpl<$Res> extends _$NatureCopyWithImpl<$Res>
    implements _$NatureCopyWith<$Res> {
  __$NatureCopyWithImpl(_Nature _value, $Res Function(_Nature) _then)
      : super(_value, (v) => _then(v as _Nature));

  @override
  _Nature get _value => super._value as _Nature;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? nameJp = freezed,
    Object? decreasedStatIdentifier = freezed,
    Object? increasedStatIdentifier = freezed,
  }) {
    return _then(_Nature(
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
      decreasedStatIdentifier: decreasedStatIdentifier == freezed
          ? _value.decreasedStatIdentifier
          : decreasedStatIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      increasedStatIdentifier: increasedStatIdentifier == freezed
          ? _value.increasedStatIdentifier
          : increasedStatIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Nature extends _Nature with DiagnosticableTreeMixin {
  const _$_Nature(
      {required this.id,
      required this.identifier,
      required this.nameJp,
      required this.decreasedStatIdentifier,
      required this.increasedStatIdentifier})
      : super._();

  factory _$_Nature.fromJson(Map<String, dynamic> json) =>
      _$_$_NatureFromJson(json);

  @override
  final int id;
  @override
  final String identifier;
  @override
  final String nameJp;
  @override
  final String decreasedStatIdentifier;
  @override
  final String increasedStatIdentifier;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Nature(id: $id, identifier: $identifier, nameJp: $nameJp, decreasedStatIdentifier: $decreasedStatIdentifier, increasedStatIdentifier: $increasedStatIdentifier)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Nature'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('nameJp', nameJp))
      ..add(DiagnosticsProperty(
          'decreasedStatIdentifier', decreasedStatIdentifier))
      ..add(DiagnosticsProperty(
          'increasedStatIdentifier', increasedStatIdentifier));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Nature &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.nameJp, nameJp) ||
                const DeepCollectionEquality().equals(other.nameJp, nameJp)) &&
            (identical(
                    other.decreasedStatIdentifier, decreasedStatIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.decreasedStatIdentifier, decreasedStatIdentifier)) &&
            (identical(
                    other.increasedStatIdentifier, increasedStatIdentifier) ||
                const DeepCollectionEquality().equals(
                    other.increasedStatIdentifier, increasedStatIdentifier)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(nameJp) ^
      const DeepCollectionEquality().hash(decreasedStatIdentifier) ^
      const DeepCollectionEquality().hash(increasedStatIdentifier);

  @JsonKey(ignore: true)
  @override
  _$NatureCopyWith<_Nature> get copyWith =>
      __$NatureCopyWithImpl<_Nature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NatureToJson(this);
  }
}

abstract class _Nature extends Nature {
  const factory _Nature(
      {required int id,
      required String identifier,
      required String nameJp,
      required String decreasedStatIdentifier,
      required String increasedStatIdentifier}) = _$_Nature;
  const _Nature._() : super._();

  factory _Nature.fromJson(Map<String, dynamic> json) = _$_Nature.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get identifier => throw _privateConstructorUsedError;
  @override
  String get nameJp => throw _privateConstructorUsedError;
  @override
  String get decreasedStatIdentifier => throw _privateConstructorUsedError;
  @override
  String get increasedStatIdentifier => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NatureCopyWith<_Nature> get copyWith => throw _privateConstructorUsedError;
}
