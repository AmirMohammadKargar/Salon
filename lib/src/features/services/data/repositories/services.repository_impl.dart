// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/services/data/datasources/services.remote_datasource.dart';
import 'package:salon/src/features/services/data/dtos/place_order.dto.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';
import 'package:salon/src/features/services/domain/repositories/services.repository.dart';

import '../../../../core/errors/exception_handler.dart';

@Injectable(as: ServicesRepository)
class ServicesRepositoryImpl extends ServicesRepository {
  final ServicesRemoteDataSource remoteDataSource;

  ServicesRepositoryImpl(this.remoteDataSource);

  @factoryMethod
  @override
  Future<Either<Failure, List<ServiceEntity>>> services() async {
    return exceptionHandler(() async {
      return await remoteDataSource.services();
    });
  }

  @factoryMethod
  @override
  Future<Either<Failure, void>> placeOrder(PlaceOrderDto body) async {
    return exceptionHandler(() async {
      return await remoteDataSource.placeOrder(body);
    }, needParse: false);
  }

  @factoryMethod
  @override
  Future<Either<Failure, List<OrderEntity>>> orders() async {
    return exceptionHandler(() async {
      return await remoteDataSource.orders();
    });
  }
}
