import 'package:dartz/dartz.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/auth/domain/entities/login.entity.dart';

import '../../data/dtos/login.dto.dart';
import '../../data/dtos/register.dto.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> register(RegisterDto body);
  Future<Either<Failure, LoginEntity>> login(LoginDto body);
}
