import 'package:dartz/dartz.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';

import '../../../../core/errors/failures.dart';
import '../../data/dtos/place_order.dto.dart';

abstract class ServicesRepository {
  Future<Either<Failure, List<ServiceEntity>>> services();
  Future<Either<Failure, List<OrderEntity>>> orders();
  Future<Either<Failure, void>> placeOrder(PlaceOrderDto body);
}
