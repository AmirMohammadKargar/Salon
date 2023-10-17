import 'package:salon/src/shared/constants/urls.dart';

class UserEntity {
  int id;
  String email;
  String username;
  bool isStoreOwner;
  String firstName;
  String image;
  String lastName;
  bool isAdmin;
  bool isBarber;
  UserEntity({
    this.id = 0,
    this.email = '',
    this.username = '',
    this.firstName = '',
    this.image = '',
    this.lastName = '',
    this.isAdmin = false,
    this.isBarber = false,
    this.isStoreOwner = false,
  });

  String get getImage => Urls.baseUrl + image;
}
