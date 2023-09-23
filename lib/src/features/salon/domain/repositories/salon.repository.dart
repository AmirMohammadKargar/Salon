import 'package:dartz/dartz.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';

import '../../data/dtos/salons.dto.dart';

abstract class SalonRepository {
  Future<Either<Failure, List<SalonEntity>>> salons(SalonsDto queryParams);
  Future<Either<Failure, SalonEntity>> salon(int id);
}
