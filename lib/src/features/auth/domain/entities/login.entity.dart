import 'package:salon/src/features/user/domain/entities/user.entity.dart';

class LoginEntity {
  UserEntity? user;
  String token;
  LoginEntity({this.user, this.token = ''});
}
