import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/cache/cache_db.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/shared/constants/cache_keys.dart';

class ProfileManager with ChangeNotifier {
  Future<void> logOut(BuildContext context) async {
    var cacheDB = CacheDb();
    await cacheDB.removeFromDb(CacheKeys.token);
    Store.user = null;
    // ignore: use_build_context_synchronously
    GoRouter.of(context).goNamed(Routes.login);
  }
}
