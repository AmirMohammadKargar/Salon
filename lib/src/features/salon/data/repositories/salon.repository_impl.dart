// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/salon/data/datasources/salon.remote_datasource.dart';
import 'package:salon/src/features/salon/data/dtos/salons.dto.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';
import 'package:salon/src/features/salon/domain/repositories/salon.repository.dart';

import '../../../../core/errors/exception_handler.dart';

@Injectable(as: SalonRepository)
class SalonRepositoryImpl extends SalonRepository {
  final SalonRemoteDatasource remoteDataSource;

  SalonRepositoryImpl(this.remoteDataSource);

  @factoryMethod
  @override
  Future<Either<Failure, List<SalonEntity>>> salons(
      SalonsDto queryParams) async {
    return exceptionHandler(() async {
      return await remoteDataSource.salons(queryParams);
    });
  }

  @factoryMethod
  @override
  Future<Either<Failure, SalonEntity>> salon(int id) async {
    return exceptionHandler(() async {
      return await remoteDataSource.salon(id);
    });
  }
}
