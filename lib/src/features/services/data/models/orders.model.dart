// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';

import 'order.model.dart';

part 'orders.model.freezed.dart';
part 'orders.model.g.dart';

@freezed
// ignore: must_be_immutable
class OrdersModel with _$OrdersModel {
  OrdersModel._();
  factory OrdersModel({@Default([]) List<OrderModel> orders}) = _OrdersModel;

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  List<OrderEntity> get toEntity => orders.map((e) => e.toEntity).toList();
}
