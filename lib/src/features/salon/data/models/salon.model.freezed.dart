// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalonModel _$SalonModelFromJson(Map<String, dynamic> json) {
  return _SalonModel.fromJson(json);
}

/// @nodoc
mixin _$SalonModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  int get ownerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;
  String get map => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalonModelCopyWith<SalonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalonModelCopyWith<$Res> {
  factory $SalonModelCopyWith(
          SalonModel value, $Res Function(SalonModel) then) =
      _$SalonModelCopyWithImpl<$Res, SalonModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'owner_id') int ownerId,
      String name,
      String phone,
      String address,
      String description,
      String image,
      String video,
      String map,
      bool verified});
}

/// @nodoc
class _$SalonModelCopyWithImpl<$Res, $Val extends SalonModel>
    implements $SalonModelCopyWith<$Res> {
  _$SalonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? description = null,
    Object? image = null,
    Object? video = null,
    Object? map = null,
    Object? verified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalonModelCopyWith<$Res>
    implements $SalonModelCopyWith<$Res> {
  factory _$$_SalonModelCopyWith(
          _$_SalonModel value, $Res Function(_$_SalonModel) then) =
      __$$_SalonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'owner_id') int ownerId,
      String name,
      String phone,
      String address,
      String description,
      String image,
      String video,
      String map,
      bool verified});
}

/// @nodoc
class __$$_SalonModelCopyWithImpl<$Res>
    extends _$SalonModelCopyWithImpl<$Res, _$_SalonModel>
    implements _$$_SalonModelCopyWith<$Res> {
  __$$_SalonModelCopyWithImpl(
      _$_SalonModel _value, $Res Function(_$_SalonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? description = null,
    Object? image = null,
    Object? video = null,
    Object? map = null,
    Object? verified = null,
  }) {
    return _then(_$_SalonModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalonModel extends _SalonModel {
  _$_SalonModel(
      {this.id = 0,
      @JsonKey(name: 'owner_id') this.ownerId = 0,
      this.name = '',
      this.phone = '',
      this.address = '',
      this.description = '',
      this.image = '',
      this.video = '',
      this.map = '',
      this.verified = true})
      : super._();

  factory _$_SalonModel.fromJson(Map<String, dynamic> json) =>
      _$$_SalonModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'owner_id')
  final int ownerId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String video;
  @override
  @JsonKey()
  final String map;
  @override
  @JsonKey()
  final bool verified;

  @override
  String toString() {
    return 'SalonModel(id: $id, ownerId: $ownerId, name: $name, phone: $phone, address: $address, description: $description, image: $image, video: $video, map: $map, verified: $verified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.map, map) || other.map == map) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ownerId, name, phone,
      address, description, image, video, map, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalonModelCopyWith<_$_SalonModel> get copyWith =>
      __$$_SalonModelCopyWithImpl<_$_SalonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalonModelToJson(
      this,
    );
  }
}

abstract class _SalonModel extends SalonModel {
  factory _SalonModel(
      {final int id,
      @JsonKey(name: 'owner_id') final int ownerId,
      final String name,
      final String phone,
      final String address,
      final String description,
      final String image,
      final String video,
      final String map,
      final bool verified}) = _$_SalonModel;
  _SalonModel._() : super._();

  factory _SalonModel.fromJson(Map<String, dynamic> json) =
      _$_SalonModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'owner_id')
  int get ownerId;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get description;
  @override
  String get image;
  @override
  String get video;
  @override
  String get map;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$_SalonModelCopyWith<_$_SalonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
