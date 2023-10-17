import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/features/services/data/dtos/place_order.dto.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/service.entity.dart';
import '../repositories/services.repository.dart';

@Injectable()
class ServicesUsecase extends UseCase<List<ServiceEntity>, NoParams> {
  final ServicesRepository repository;
  ServicesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ServiceEntity>>> call(NoParams params) async {
    return await repository.services();
  }
}
//--------------------------------------------------

@Injectable()
class PlaceOrderUsecase extends UseCase<void, PlaceOrderParams> {
  final ServicesRepository repository;
  PlaceOrderUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(PlaceOrderParams params) async {
    return await repository.placeOrder(params.body);
  }
}

class PlaceOrderParams extends Equatable {
  final PlaceOrderDto body;
  const PlaceOrderParams({required this.body});

  @override
  List<Object?> get props => [body];
}

//--------------------------------------------------


@Injectable()
class OrdersUsecase extends UseCase<List<OrderEntity>, NoParams> {
  final ServicesRepository repository;
  OrdersUsecase(this.repository);

  @override
  Future<Either<Failure, List<OrderEntity>>> call(NoParams params) async {
    return await repository.orders();
  }
}
