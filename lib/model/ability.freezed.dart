// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return _Ability.fromJson(json);
}

/// @nodoc
class _$AbilityTearOff {
  const _$AbilityTearOff();

  _Ability call(
      {required int id,
      required String identifier,
      required int slot,
      @JsonKey(name: 'is_hidden', fromJson: intToBool) required bool isHidden,
      @JsonKey(name: 'name_jp') required String nameJp,
      @JsonKey(name: 'flavor_text_jp') required String flavorTextJp}) {
    return _Ability(
      id: id,
      identifier: identifier,
      slot: slot,
      isHidden: isHidden,
      nameJp: nameJp,
      flavorTextJp: flavorTextJp,
    );
  }

  Ability fromJson(Map<String, Object?> json) {
    return Ability.fromJson(json);
  }
}

/// @nodoc
const $Ability = _$AbilityTearOff();

/// @nodoc
mixin _$Ability {
  int get id => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  int get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden', fromJson: intToBool)
  bool get isHidden => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_jp')
  String get nameJp => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavor_text_jp')
  String get flavorTextJp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbilityCopyWith<Ability> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbilityCopyWith<$Res> {
  factory $AbilityCopyWith(Ability value, $Res Function(Ability) then) =
      _$AbilityCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String identifier,
      int slot,
      @JsonKey(name: 'is_hidden', fromJson: intToBool) bool isHidden,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'flavor_text_jp') String flavorTextJp});
}

/// @nodoc
class _$AbilityCopyWithImpl<$Res> implements $AbilityCopyWith<$Res> {
  _$AbilityCopyWithImpl(this._value, this._then);

  final Ability _value;
  // ignore: unused_field
  final $Res Function(Ability) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? slot = freezed,
    Object? isHidden = freezed,
    Object? nameJp = freezed,
    Object? flavorTextJp = freezed,
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
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AbilityCopyWith<$Res> implements $AbilityCopyWith<$Res> {
  factory _$AbilityCopyWith(_Ability value, $Res Function(_Ability) then) =
      __$AbilityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String identifier,
      int slot,
      @JsonKey(name: 'is_hidden', fromJson: intToBool) bool isHidden,
      @JsonKey(name: 'name_jp') String nameJp,
      @JsonKey(name: 'flavor_text_jp') String flavorTextJp});
}

/// @nodoc
class __$AbilityCopyWithImpl<$Res> extends _$AbilityCopyWithImpl<$Res>
    implements _$AbilityCopyWith<$Res> {
  __$AbilityCopyWithImpl(_Ability _value, $Res Function(_Ability) _then)
      : super(_value, (v) => _then(v as _Ability));

  @override
  _Ability get _value => super._value as _Ability;

  @override
  $Res call({
    Object? id = freezed,
    Object? identifier = freezed,
    Object? slot = freezed,
    Object? isHidden = freezed,
    Object? nameJp = freezed,
    Object? flavorTextJp = freezed,
  }) {
    return _then(_Ability(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      identifier: identifier == freezed
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      slot: slot == freezed
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: isHidden == freezed
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      nameJp: nameJp == freezed
          ? _value.nameJp
          : nameJp // ignore: cast_nullable_to_non_nullable
              as String,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ability extends _Ability with DiagnosticableTreeMixin {
  const _$_Ability(
      {required this.id,
      required this.identifier,
      required this.slot,
      @JsonKey(name: 'is_hidden', fromJson: intToBool) required this.isHidden,
      @JsonKey(name: 'name_jp') required this.nameJp,
      @JsonKey(name: 'flavor_text_jp') required this.flavorTextJp})
      : super._();

  factory _$_Ability.fromJson(Map<String, dynamic> json) =>
      _$$_AbilityFromJson(json);

  @override
  final int id;
  @override
  final String identifier;
  @override
  final int slot;
  @override
  @JsonKey(name: 'is_hidden', fromJson: intToBool)
  final bool isHidden;
  @override
  @JsonKey(name: 'name_jp')
  final String nameJp;
  @override
  @JsonKey(name: 'flavor_text_jp')
  final String flavorTextJp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ability(id: $id, identifier: $identifier, slot: $slot, isHidden: $isHidden, nameJp: $nameJp, flavorTextJp: $flavorTextJp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ability'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('slot', slot))
      ..add(DiagnosticsProperty('isHidden', isHidden))
      ..add(DiagnosticsProperty('nameJp', nameJp))
      ..add(DiagnosticsProperty('flavorTextJp', flavorTextJp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ability &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.identifier, identifier) &&
            const DeepCollectionEquality().equals(other.slot, slot) &&
            const DeepCollectionEquality().equals(other.isHidden, isHidden) &&
            const DeepCollectionEquality().equals(other.nameJp, nameJp) &&
            const DeepCollectionEquality()
                .equals(other.flavorTextJp, flavorTextJp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(identifier),
      const DeepCollectionEquality().hash(slot),
      const DeepCollectionEquality().hash(isHidden),
      const DeepCollectionEquality().hash(nameJp),
      const DeepCollectionEquality().hash(flavorTextJp));

  @JsonKey(ignore: true)
  @override
  _$AbilityCopyWith<_Ability> get copyWith =>
      __$AbilityCopyWithImpl<_Ability>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AbilityToJson(this);
  }
}

abstract class _Ability extends Ability {
  const factory _Ability(
      {required int id,
      required String identifier,
      required int slot,
      @JsonKey(name: 'is_hidden', fromJson: intToBool)
          required bool isHidden,
      @JsonKey(name: 'name_jp')
          required String nameJp,
      @JsonKey(name: 'flavor_text_jp')
          required String flavorTextJp}) = _$_Ability;
  const _Ability._() : super._();

  factory _Ability.fromJson(Map<String, dynamic> json) = _$_Ability.fromJson;

  @override
  int get id;
  @override
  String get identifier;
  @override
  int get slot;
  @override
  @JsonKey(name: 'is_hidden', fromJson: intToBool)
  bool get isHidden;
  @override
  @JsonKey(name: 'name_jp')
  String get nameJp;
  @override
  @JsonKey(name: 'flavor_text_jp')
  String get flavorTextJp;
  @override
  @JsonKey(ignore: true)
  _$AbilityCopyWith<_Ability> get copyWith =>
      throw _privateConstructorUsedError;
}
