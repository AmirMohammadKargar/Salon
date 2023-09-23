import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/cache/cache_db.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/auth/data/dtos/register.dto.dart';
import 'package:salon/src/features/auth/domain/usecases/auth.usecases.dart';
import 'package:salon/src/shared/constants/cache_keys.dart';

class SignupManager with ChangeNotifier {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  Future<void> register(BuildContext context) async {
    if (userNameController.text.isEmpty) {
      ErrorHandler.showErrorSnack(
          context: context, message: 'نام کاربری معتبر نیست');
      return;
    }
    if (emailController.text.isEmpty) {
      ErrorHandler.showErrorSnack(
          context: context, message: 'ایمیل معتبر نیست');
      return;
    }
    if (passwordController.text.isEmpty) {
      ErrorHandler.showErrorSnack(
          context: context, message: 'رمز عبور معتبر نیست');
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      ErrorHandler.showErrorSnack(
          context: context, message: 'تکرار رمز عبور معتبر نیست');
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ErrorHandler.showErrorSnack(
          context: context, message: 'رمز عبور و تکرار رمز عبور یکسان نیست');
      return;
    }
    loading = true;
    notifyListeners();
    var res = await getIt<RegisterUsecase>().call(
      RegisterParams(
        body: RegisterDto(
          email: emailController.text,
          password: passwordController.text,
          username: userNameController.text,
        ),
      ),
    );
    loading = false;
    notifyListeners();
    res.fold((failure) {
      ErrorHandler.showErrorSnack(context: context, failure: failure);
    }, (response) {
      var cacheDb = CacheDb();
      cacheDb.saveToDbString(CacheKeys.token, response.token);
      Store.token = response.token;
      Store.user = response.user;
      GoRouter.of(context).goNamed(Routes.salonList);
    });
  }
}
