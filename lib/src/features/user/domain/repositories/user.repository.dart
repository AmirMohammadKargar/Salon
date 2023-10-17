import 'package:dartz/dartz.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/features/user/data/dtos/upload_body.dto.dart';
import 'package:salon/src/features/user/domain/entities/upload.entity.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';

import '../../data/dtos/update_user_body.dto.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> user();
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserDto body);
  Future<Either<Failure, UploadEntity>> upload(
      UploadDto body);
}
