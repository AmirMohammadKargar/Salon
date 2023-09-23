// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salons.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalonsModel _$SalonsModelFromJson(Map<String, dynamic> json) {
  return _SalonsModel.fromJson(json);
}

/// @nodoc
mixin _$SalonsModel {
  List<SalonModel> get salons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalonsModelCopyWith<SalonsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonsModelCopyWith<$Res> {
  factory $SalonsModelCopyWith(
          SalonsModel value, $Res Function(SalonsModel) then) =
      _$SalonsModelCopyWithImpl<$Res, SalonsModel>;
  @useResult
  $Res call({List<SalonModel> salons});
}

/// @nodoc
class _$SalonsModelCopyWithImpl<$Res, $Val extends SalonsModel>
    implements $SalonsModelCopyWith<$Res> {
  _$SalonsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salons = null,
  }) {
    return _then(_value.copyWith(
      salons: null == salons
          ? _value.salons
          : salons // ignore: cast_nullable_to_non_nullable
              as List<SalonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalonsModelCopyWith<$Res>
    implements $SalonsModelCopyWith<$Res> {
  factory _$$_SalonsModelCopyWith(
          _$_SalonsModel value, $Res Function(_$_SalonsModel) then) =
      __$$_SalonsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SalonModel> salons});
}

/// @nodoc
class __$$_SalonsModelCopyWithImpl<$Res>
    extends _$SalonsModelCopyWithImpl<$Res, _$_SalonsModel>
    implements _$$_SalonsModelCopyWith<$Res> {
  __$$_SalonsModelCopyWithImpl(
      _$_SalonsModel _value, $Res Function(_$_SalonsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salons = null,
  }) {
    return _then(_$_SalonsModel(
      salons: null == salons
          ? _value._salons
          : salons // ignore: cast_nullable_to_non_nullable
              as List<SalonModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalonsModel extends _SalonsModel {
  _$_SalonsModel({final List<SalonModel> salons = const []})
      : _salons = salons,
        super._();

  factory _$_SalonsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SalonsModelFromJson(json);

  final List<SalonModel> _salons;
  @override
  @JsonKey()
  List<SalonModel> get salons {
    if (_salons is EqualUnmodifiableListView) return _salons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salons);
  }

  @override
  String toString() {
    return 'SalonsModel(salons: $salons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalonsModel &&
            const DeepCollectionEquality().equals(other._salons, _salons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_salons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonsModelCopyWith<_$_SalonsModel> get copyWith =>
      __$$_SalonsModelCopyWithImpl<_$_SalonsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalonsModelToJson(
      this,
    );
  }
}

abstract class _SalonsModel extends SalonsModel {
  factory _SalonsModel({final List<SalonModel> salons}) = _$_SalonsModel;
  _SalonsModel._() : super._();

  factory _SalonsModel.fromJson(Map<String, dynamic> json) =
      _$_SalonsModel.fromJson;

  @override
  List<SalonModel> get salons;
  @override
  @JsonKey(ignore: true)
  _$$_SalonsModelCopyWith<_$_SalonsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
