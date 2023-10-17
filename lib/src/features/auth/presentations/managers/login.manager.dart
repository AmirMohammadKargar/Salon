import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/auth/data/dtos/login.dto.dart';
import 'package:salon/src/features/auth/domain/usecases/auth.usecases.dart';

import '../../../../core/cache/cache_db.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/router/routes.dart';
import '../../../../shared/constants/cache_keys.dart';

class LoginManager with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  Future<void> login(BuildContext context) async {
    loading = true;
    notifyListeners();
    var res = await getIt<LoginUsecase>().call(
      LoginParams(
        body: LoginDto(
            email: emailController.text, password: passwordController.text),
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
