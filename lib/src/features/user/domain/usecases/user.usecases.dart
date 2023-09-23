import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';
import 'package:salon/src/features/user/domain/repositories/user.repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';

@Injectable()
class UserUsecase extends UseCase<UserEntity, NoParams> {
  final UserRepository repository;
  UserUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.user();
  }
}
