// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersModel _$$_OrdersModelFromJson(Map<String, dynamic> json) =>
    _$_OrdersModel(
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_OrdersModelToJson(_$_OrdersModel instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };
