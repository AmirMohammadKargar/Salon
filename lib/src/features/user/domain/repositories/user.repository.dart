import 'package:dartz/dartz.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> user();
}
