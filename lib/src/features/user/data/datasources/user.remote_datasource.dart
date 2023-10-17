import 'package:injectable/injectable.dart';
import 'package:salon/src/features/user/data/models/user.model.dart';
import 'package:salon/src/shared/constants/urls.dart';

import '../../../../core/network/http_client.dart';
import '../../domain/entities/upload.entity.dart';
import '../dtos/update_user_body.dto.dart';
import '../dtos/upload_body.dto.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> user();
  Future<UserModel> updateUser( UpdateUserDto body);
  Future<UploadEntity> upload(UploadDto body);
}

@Injectable(as: UserRemoteDatasource)
class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final AppHttpClient httpClient;
  UserRemoteDatasourceImpl(this.httpClient);

  @override
  Future<UserModel> user() async {
    var jsonRes = await httpClient.get(Urls.user);
    return UserModel.fromJson(jsonRes);
  }

  @override
  Future<UserModel> updateUser( UpdateUserDto body) async {
    var jsonRes = await httpClient.patch(
      Urls.pathUser,
      data: body.toJson(),
    );
    return UserModel.fromJson(jsonRes);
  }
  
  @override
  Future<UploadEntity> upload(UploadDto body)async {
     var jsonRes = await httpClient.post(
      Urls.upload,
      formData: await body.formData()
    );
    return UploadEntity.fromJson(jsonRes);
  }
}
