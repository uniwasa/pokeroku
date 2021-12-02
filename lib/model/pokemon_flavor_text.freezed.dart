// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon_flavor_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonFlavorText _$PokemonFlavorTextFromJson(Map<String, dynamic> json) {
  return _PokemonFlavorText.fromJson(json);
}

/// @nodoc
class _$PokemonFlavorTextTearOff {
  const _$PokemonFlavorTextTearOff();

  _PokemonFlavorText call(
      {required int versionId,
      required String flavorTextJp,
      required String flavorTextEn}) {
    return _PokemonFlavorText(
      versionId: versionId,
      flavorTextJp: flavorTextJp,
      flavorTextEn: flavorTextEn,
    );
  }

  PokemonFlavorText fromJson(Map<String, Object> json) {
    return PokemonFlavorText.fromJson(json);
  }
}

/// @nodoc
const $PokemonFlavorText = _$PokemonFlavorTextTearOff();

/// @nodoc
mixin _$PokemonFlavorText {
  int get versionId => throw _privateConstructorUsedError;
  String get flavorTextJp => throw _privateConstructorUsedError;
  String get flavorTextEn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonFlavorTextCopyWith<PokemonFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonFlavorTextCopyWith<$Res> {
  factory $PokemonFlavorTextCopyWith(
          PokemonFlavorText value, $Res Function(PokemonFlavorText) then) =
      _$PokemonFlavorTextCopyWithImpl<$Res>;
  $Res call({int versionId, String flavorTextJp, String flavorTextEn});
}

/// @nodoc
class _$PokemonFlavorTextCopyWithImpl<$Res>
    implements $PokemonFlavorTextCopyWith<$Res> {
  _$PokemonFlavorTextCopyWithImpl(this._value, this._then);

  final PokemonFlavorText _value;
  // ignore: unused_field
  final $Res Function(PokemonFlavorText) _then;

  @override
  $Res call({
    Object? versionId = freezed,
    Object? flavorTextJp = freezed,
    Object? flavorTextEn = freezed,
  }) {
    return _then(_value.copyWith(
      versionId: versionId == freezed
          ? _value.versionId
          : versionId // ignore: cast_nullable_to_non_nullable
              as int,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
      flavorTextEn: flavorTextEn == freezed
          ? _value.flavorTextEn
          : flavorTextEn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PokemonFlavorTextCopyWith<$Res>
    implements $PokemonFlavorTextCopyWith<$Res> {
  factory _$PokemonFlavorTextCopyWith(
          _PokemonFlavorText value, $Res Function(_PokemonFlavorText) then) =
      __$PokemonFlavorTextCopyWithImpl<$Res>;
  @override
  $Res call({int versionId, String flavorTextJp, String flavorTextEn});
}

/// @nodoc
class __$PokemonFlavorTextCopyWithImpl<$Res>
    extends _$PokemonFlavorTextCopyWithImpl<$Res>
    implements _$PokemonFlavorTextCopyWith<$Res> {
  __$PokemonFlavorTextCopyWithImpl(
      _PokemonFlavorText _value, $Res Function(_PokemonFlavorText) _then)
      : super(_value, (v) => _then(v as _PokemonFlavorText));

  @override
  _PokemonFlavorText get _value => super._value as _PokemonFlavorText;

  @override
  $Res call({
    Object? versionId = freezed,
    Object? flavorTextJp = freezed,
    Object? flavorTextEn = freezed,
  }) {
    return _then(_PokemonFlavorText(
      versionId: versionId == freezed
          ? _value.versionId
          : versionId // ignore: cast_nullable_to_non_nullable
              as int,
      flavorTextJp: flavorTextJp == freezed
          ? _value.flavorTextJp
          : flavorTextJp // ignore: cast_nullable_to_non_nullable
              as String,
      flavorTextEn: flavorTextEn == freezed
          ? _value.flavorTextEn
          : flavorTextEn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_PokemonFlavorText extends _PokemonFlavorText
    with DiagnosticableTreeMixin {
  const _$_PokemonFlavorText(
      {required this.versionId,
      required this.flavorTextJp,
      required this.flavorTextEn})
      : super._();

  factory _$_PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$_$_PokemonFlavorTextFromJson(json);

  @override
  final int versionId;
  @override
  final String flavorTextJp;
  @override
  final String flavorTextEn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonFlavorText(versionId: $versionId, flavorTextJp: $flavorTextJp, flavorTextEn: $flavorTextEn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonFlavorText'))
      ..add(DiagnosticsProperty('versionId', versionId))
      ..add(DiagnosticsProperty('flavorTextJp', flavorTextJp))
      ..add(DiagnosticsProperty('flavorTextEn', flavorTextEn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonFlavorText &&
            (identical(other.versionId, versionId) ||
                const DeepCollectionEquality()
                    .equals(other.versionId, versionId)) &&
            (identical(other.flavorTextJp, flavorTextJp) ||
                const DeepCollectionEquality()
                    .equals(other.flavorTextJp, flavorTextJp)) &&
            (identical(other.flavorTextEn, flavorTextEn) ||
                const DeepCollectionEquality()
                    .equals(other.flavorTextEn, flavorTextEn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(versionId) ^
      const DeepCollectionEquality().hash(flavorTextJp) ^
      const DeepCollectionEquality().hash(flavorTextEn);

  @JsonKey(ignore: true)
  @override
  _$PokemonFlavorTextCopyWith<_PokemonFlavorText> get copyWith =>
      __$PokemonFlavorTextCopyWithImpl<_PokemonFlavorText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PokemonFlavorTextToJson(this);
  }
}

abstract class _PokemonFlavorText extends PokemonFlavorText {
  const factory _PokemonFlavorText(
      {required int versionId,
      required String flavorTextJp,
      required String flavorTextEn}) = _$_PokemonFlavorText;
  const _PokemonFlavorText._() : super._();

  factory _PokemonFlavorText.fromJson(Map<String, dynamic> json) =
      _$_PokemonFlavorText.fromJson;

  @override
  int get versionId => throw _privateConstructorUsedError;
  @override
  String get flavorTextJp => throw _privateConstructorUsedError;
  @override
  String get flavorTextEn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonFlavorTextCopyWith<_PokemonFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}
