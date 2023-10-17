// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServicesModel _$$_ServicesModelFromJson(Map<String, dynamic> json) =>
    _$_ServicesModel(
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ServicesModelToJson(_$_ServicesModel instance) =>
    <String, dynamic>{
      'services': instance.services,
    };
