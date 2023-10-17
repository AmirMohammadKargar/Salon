// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';

import '../../../salon/data/models/salon.model.dart';

part 'order.model.freezed.dart';
part 'order.model.g.dart';

@freezed
// ignore: must_be_immutable
class OrderModel with _$OrderModel {
  OrderModel._();
  factory OrderModel({
    @Default(0) int id,
    @Default('') String reservedHour,
    @Default('') String status,
    @Default('') String time,
    SalonModel? salon,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  OrderEntity get toEntity => OrderEntity(
        id: id,
        reservedHour: reservedHour,
        status: status,
        time: time,
        salon: salon?.toEntity,
      );
}
