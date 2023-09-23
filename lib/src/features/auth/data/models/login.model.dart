// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salon/src/features/user/data/models/user.model.dart';

import '../../domain/entities/login.entity.dart';

part 'login.model.freezed.dart';
part 'login.model.g.dart';

@freezed
// ignore: must_be_immutable
class LoginModel with _$LoginModel {
  LoginModel._();
  factory LoginModel({
    UserModel? user,
    @Default('') token,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  LoginEntity get toEntity => LoginEntity(
        user: user?.toEntity,
        token: token,
      );
}
