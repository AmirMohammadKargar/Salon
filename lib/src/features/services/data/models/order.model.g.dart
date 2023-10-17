// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int? ?? 0,
      reservedHour: json['reservedHour'] as String? ?? '',
      status: json['status'] as String? ?? '',
      time: json['time'] as String? ?? '',
      salon: json['salon'] == null
          ? null
          : SalonModel.fromJson(json['salon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reservedHour': instance.reservedHour,
      'status': instance.status,
      'time': instance.time,
      'salon': instance.salon,
    };
