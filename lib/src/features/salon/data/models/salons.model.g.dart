// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salons.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalonsModel _$$_SalonsModelFromJson(Map<String, dynamic> json) =>
    _$_SalonsModel(
      salons: (json['salons'] as List<dynamic>?)
              ?.map((e) => SalonModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SalonsModelToJson(_$_SalonsModel instance) =>
    <String, dynamic>{
      'salons': instance.salons,
    };
