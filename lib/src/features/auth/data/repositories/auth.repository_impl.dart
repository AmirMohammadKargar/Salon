// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/auth/data/datasources/auth.remote_datasource.dart';
import 'package:salon/src/features/auth/data/dtos/login.dto.dart';
import 'package:salon/src/features/auth/data/dtos/register.dto.dart';
import 'package:salon/src/features/auth/domain/entities/login.entity.dart';

import '../../../../core/errors/exception_handler.dart';
import '../../domain/repositories/auth.repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @factoryMethod
  @override
  Future<Either<Failure, LoginEntity>> register(RegisterDto body) async {
    return exceptionHandler(() async {
      return await remoteDataSource.register(body);
    });
  }

  @factoryMethod
  @override
  Future<Either<Failure, LoginEntity>> login(LoginDto body) async {
    return exceptionHandler(() async {
      return await remoteDataSource.login(body);
    });
  }
}
