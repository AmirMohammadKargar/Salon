import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/router/router.dart';
import '../core/theme/theme.dart';
import '../dependency_injections/di_container.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      path: 'assets/i18n',
      startLocale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .orientation ==
              Orientation.landscape
          ? const Size(1024, 768)
          : const Size(375, 786),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, _) => CTheme(
        dimens: dimens,
        theme: appTheme,
        textTheme: lightTextTheme,
        child: MaterialApp.router(
          title: 'Salon',
          theme: AppTheme.ligthTheme,
          routeInformationProvider: appRouter.router.routeInformationProvider,
          routeInformationParser: appRouter.router.routeInformationParser,
          routerDelegate: appRouter.router.routerDelegate,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
