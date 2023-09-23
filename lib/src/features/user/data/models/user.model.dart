// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/user/domain/entities/user.entity.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
// ignore: must_be_immutable
class UserModel with _$UserModel {
  UserModel._();
  factory UserModel({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String username,
    @Default(false) bool isStoreOwner,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(false) bool isAdmin,
    @Default(false) bool isBarber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity get toEntity => UserEntity(
        id: id,
        username: username,
        email: email,
        lastName: lastName,
        isAdmin: isAdmin,
        isBarber: isBarber,
        isStoreOwner: isStoreOwner,
      );
}
