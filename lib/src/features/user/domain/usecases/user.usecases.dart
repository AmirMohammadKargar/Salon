import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:salon/src/features/user/data/dtos/update_user_body.dto.dart';
import 'package:salon/src/features/user/domain/entities/upload.entity.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';
import 'package:salon/src/features/user/domain/repositories/user.repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/dtos/upload_body.dto.dart';

@Injectable()
class UserUsecase extends UseCase<UserEntity, NoParams> {
  final UserRepository repository;
  UserUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.user();
  }
}

//--------------------------------------------------

@Injectable()
class UpdateUserUsecase extends UseCase<UserEntity, UpdateUserParams> {
  final UserRepository repository;
  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) async {
    return await repository.updateUser(params.body);
  }
}

class UpdateUserParams extends Equatable {
  final UpdateUserDto body;

  const UpdateUserParams({ required this.body});

  @override
  List<Object?> get props => [body];
}
//--------------------------------------------------

@Injectable()
class UploadUsecase extends UseCase<UploadEntity, UploadParams> {
  final UserRepository repository;
  UploadUsecase(this.repository);

  @override
  Future<Either<Failure, UploadEntity>> call(UploadParams params) async {
    return await repository.upload(params.body);
  }
}

class UploadParams extends Equatable {
  final UploadDto body;

  const UploadParams({required this.body});

  @override
  List<Object?> get props => [body];
}
