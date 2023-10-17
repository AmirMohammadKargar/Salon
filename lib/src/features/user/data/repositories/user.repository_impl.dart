// ignore_for_file: lines_longer_than_80_chars

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/user/data/datasources/user.remote_datasource.dart';
import 'package:salon/src/features/user/data/dtos/update_user_body.dto.dart';
import 'package:salon/src/features/user/data/dtos/upload_body.dto.dart';
import 'package:salon/src/features/user/domain/entities/upload.entity.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';
import 'package:salon/src/features/user/domain/repositories/user.repository.dart';

import '../../../../core/errors/exception_handler.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @factoryMethod
  @override
  Future<Either<Failure, UserEntity>> user() async {
    return exceptionHandler(() async {
      return await remoteDataSource.user();
    });
  }

  @factoryMethod
  @override
  Future<Either<Failure, UserEntity>> updateUser(
      UpdateUserDto body) async {
    return exceptionHandler(() async {
      return await remoteDataSource.updateUser( body);
    });
  }

  @factoryMethod
  @override
  Future<Either<Failure, UploadEntity>> upload(UploadDto body) {
    return exceptionHandler(() async {
      return await remoteDataSource.upload(body);
    });
  }
}
