import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';
import 'package:salon/src/features/salon/domain/repositories/salon.repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/dtos/salons.dto.dart';

@Injectable()
class SalonsUsecase extends UseCase<List<SalonEntity>, SalonsParams> {
  final SalonRepository repository;
  SalonsUsecase(this.repository);

  @override
  Future<Either<Failure, List<SalonEntity>>> call(SalonsParams params) async {
    return await repository.salons(params.queryParams);
  }
}

class SalonsParams extends Equatable {
  final SalonsDto queryParams;

  const SalonsParams({required this.queryParams});

  @override
  List<Object?> get props => [queryParams];
}
//--------------------------------------------------

@Injectable()
class SalonUsecase extends UseCase<SalonEntity, SalonParams> {
  final SalonRepository repository;
  SalonUsecase(this.repository);

  @override
  Future<Either<Failure, SalonEntity>> call(SalonParams params) async {
    return await repository.salon(params.id);
  }
}

class SalonParams extends Equatable {
  final int id;

  const SalonParams({required this.id});

  @override
  List<Object?> get props => [id];
}
