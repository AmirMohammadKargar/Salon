import 'package:injectable/injectable.dart';
import 'package:salon/src/shared/constants/urls.dart';

import '../../../../core/network/http_client.dart';
import '../dtos/login.dto.dart';
import '../dtos/register.dto.dart';
import '../models/login.model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginModel> register(RegisterDto body);
  Future<LoginModel> login(LoginDto body);
}

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AppHttpClient httpClient;
  AuthRemoteDatasourceImpl(this.httpClient);

  @override
  Future<LoginModel> register(RegisterDto body) async {
    var jsonRes = await httpClient.post(Urls.register, data: body.toJson());
    return LoginModel.fromJson(jsonRes);
  }

  @override
  Future<LoginModel> login(LoginDto body) async {
    var jsonRes = await httpClient.post(Urls.login, data: body.toJson());
    return LoginModel.fromJson(jsonRes);
  }
}
