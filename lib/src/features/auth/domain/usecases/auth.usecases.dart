import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/features/auth/data/dtos/register.dto.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/dtos/login.dto.dart';
import '../entities/login.entity.dart';
import '../repositories/auth.repository.dart';

@Injectable()
class RegisterUsecase extends UseCase<LoginEntity, RegisterParams> {
  final AuthRepository repository;
  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(RegisterParams params) async {
    return await repository.register(params.body);
  }
}

class RegisterParams extends Equatable {
  final RegisterDto body;

  const RegisterParams({required this.body});

  @override
  List<Object?> get props => [body];
}
//--------------------------------------------------

@Injectable()
class LoginUsecase extends UseCase<LoginEntity, LoginParams> {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params) async {
    return await repository.login(params.body);
  }
}

class LoginParams extends Equatable {
  final LoginDto body;

  const LoginParams({required this.body});

  @override
  List<Object?> get props => [body];
}
