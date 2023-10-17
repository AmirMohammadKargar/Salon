import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/features/auth/presentations/pages/login.screen.dart';
import 'package:salon/src/features/auth/presentations/pages/signup.screen.dart';
import 'package:salon/src/features/profile/presentations/pages/profile.screen.dart';
import 'package:salon/src/features/salon/presentations/pages/salon.screen.dart';
import 'package:salon/src/features/salon/presentations/pages/salons_list.screen.dart';
import 'package:salon/src/features/services/presentations/pages/orders.screen.dart';
import 'package:salon/src/features/user/presentation/pages/edit_user.screen.dart';

import '../../features/splash/presentations/pages/splash.screen.dart';

class AppRoute extends GoRoute {
  final bool useFade;
  AppRoute(String path, String name, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          name: name,
          routes: routes,
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              key: state.pageKey,
              child: builder(state),
            );
          },
        );
}

class AppRouter {
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  static var rootNavigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter _goRouter = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    observers: [
      GoRouterObserver(),
      routeObserver,
    ],
    initialLocation: Routes.splashPath,
    routes: <GoRoute>[
      AppRoute(
        Routes.splashPath,
        Routes.splash,
        (state) => const SplashScreen(),
      ),
      AppRoute(
        Routes.loginPath,
        Routes.login,
        (state) => const LoginScreen(),
      ),
      AppRoute(
        Routes.signupPath,
        Routes.signup,
        (state) => const SignupScreen(),
      ),
      AppRoute(
        Routes.salonListPath,
        Routes.salonList,
        (state) => const SalonsListScreen(),
      ),
      AppRoute(
        Routes.salonPath,
        Routes.salon,
        (state) => SalonScreen(
          id: int.parse(state.pathParameters['id']!),
        ),
      ),
      AppRoute(
        Routes.profilePath,
        Routes.profile,
        (state) => const ProfileScreen(),
      ),
      AppRoute(
        Routes.editUserPath,
        Routes.editUser,
        (state) => const EditUserScreen(),
      ),
      AppRoute(
        Routes.ordersPath,
        Routes.orders,
        (state) => const OrdersScreen(),
      ),
    ],
  );
  GoRouter get router => _goRouter;
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {}

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}
}
