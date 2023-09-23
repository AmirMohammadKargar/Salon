// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      isStoreOwner: json['isStoreOwner'] as bool? ?? false,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      isAdmin: json['isAdmin'] as bool? ?? false,
      isBarber: json['isBarber'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'isStoreOwner': instance.isStoreOwner,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isAdmin': instance.isAdmin,
      'isBarber': instance.isBarber,
    };
