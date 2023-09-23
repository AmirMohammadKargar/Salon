// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/cache/cache_db.dart';
import 'package:salon/src/core/errors/error_handler.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/core/usecase/base_usecase.dart';
import 'package:salon/src/dependency_injections/di_container.dart';
import 'package:salon/src/features/user/domain/usecases/user.usecases.dart';
import 'package:salon/src/shared/constants/cache_keys.dart';

import '../../../../core/router/routes.dart';

class SplashManager with ChangeNotifier {
  String loginErrorMessage = '';

  void initialScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (await userIsLogin()) {
      await getUser(context);
    } else {
      GoRouter.of(context).goNamed(Routes.login);
    }
  }

  Future<bool> userIsLogin() async {
    var cacheDb = CacheDb();
    var token = await cacheDb.getFromDbString(CacheKeys.token);
    if (token != '') Store.token = token;
    return token != '';
  }

  Future<void> getUser(BuildContext context) async {
    loginErrorMessage = '';
    notifyListeners();
    var res = await getIt<UserUsecase>().call(NoParams());
    res.fold((failure) {
      loginErrorMessage = ErrorHandler.getErrorMessage(failure);
    }, (response) {
      Store.user = response;
      GoRouter.of(context).goNamed(Routes.salonList);
    });
    notifyListeners();
  }
}
