import 'package:injectable/injectable.dart';
import 'package:salon/src/features/user/data/models/user.model.dart';
import 'package:salon/src/shared/constants/urls.dart';

import '../../../../core/network/http_client.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> user();
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
}
