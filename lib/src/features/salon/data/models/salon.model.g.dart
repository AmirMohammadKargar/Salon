// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalonModel _$$_SalonModelFromJson(Map<String, dynamic> json) =>
    _$_SalonModel(
      id: json['id'] as int? ?? 0,
      ownerId: json['ownerId'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      video: json['video'] as String? ?? '',
      map: json['map'] as String? ?? '',
    );

Map<String, dynamic> _$$_SalonModelToJson(_$_SalonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'description': instance.description,
      'image': instance.image,
      'video': instance.video,
      'map': instance.map,
    };
