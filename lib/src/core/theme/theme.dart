import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/color_pallete.dart';

/// Define a class for dimensions and sizes used throughout the app.
class Dimens {
  Dimens();

  /// Static constants for various sizes, in units of 4.
  static const int unitX1 = 4;
  static const int unitX2 = 8;
  static const int unitX3 = 12;
  static const int unitX4 = 16;
  static const int unitX5 = 20;
  static const int unitX6 = 24;
  static const int unitX7 = 28;
  static const int unitX8 = 32;
  static const int unitX9 = 36;
  static const int unitX10 = 40;
  static const int unitX11 = 44;
  static const int unitX12 = 48;
  static const int unitX13 = 52;
  static const int unitX14 = 56;
  static const int unitX15 = 60;
  static const int unitX16 = 64;
  static const int unitX17 = 68;
  static const int unitX18 = 72;
  static const int unitX19 = 76;
  static const int unitX20 = 80;

  /// Static constants for various radii, in ScreenUtil radius units.
  static double radiusX1 = 4.r;
  static double radiusX2 = 8.r;
  static double radiusX3 = 12.r;
  static double radiusX4 = 16.r;
  static double radiusX5 = 20.r;
  static double radiusX6 = 24.r;
  static double radiusX7 = 28.r;
  static double radiusX8 = 32.r;
  static double radiusX9 = 36.r;
  static double radiusX10 = 40.r;
  static double radiusX11 = 44.r;
  static double radiusX12 = 48.r;
  static double radiusX13 = 52.r;
  static double radiusX14 = 56.r;
  static double radiusX15 = 60.r;
  static double radiusX16 = 64.r;
  static double radiusX17 = 68.r;
  static double radiusX18 = 72.r;
  static double radiusX19 = 76.r;
  static double radiusX20 = 80.r;
}

class CAppTheme {
  final Color background;

  final Map<int, Color> primary;
  final Map<int, Color> grays;

  final Color yellow;

  CAppTheme({
    required this.background,
    required this.primary,
    required this.grays,
    required this.yellow,
  });
}

class CTextStyles {
  final TextStyle light10;
  final TextStyle light11;
  final TextStyle light12;
  final TextStyle light13;
  final TextStyle light14;
  final TextStyle regular10;
  final TextStyle regular11;
  final TextStyle regular12;
  final TextStyle regular13;
  final TextStyle regular14;
  final TextStyle regular15;
  final TextStyle medium10;
  final TextStyle medium11;
  final TextStyle medium12;
  final TextStyle medium13;
  final TextStyle medium14;
  final TextStyle medium15;
  final TextStyle medium16;
  final TextStyle medium24;
  final TextStyle bold10;
  final TextStyle bold11;
  final TextStyle bold12;
  final TextStyle bold13;
  final TextStyle bold14;
  final TextStyle bold15;
  final TextStyle bold16;
  final TextStyle bold18;
  final TextStyle bold20;
  final TextStyle bold23;
  final TextStyle extraBold11;
  final TextStyle extraBold15;
  final TextStyle extraBold18;
  final TextStyle extraBold21;

  CTextStyles({
    required this.light11,
    required this.light14,
    required this.medium11,
    required this.medium14,
    required this.light10,
    required this.light12,
    required this.light13,
    required this.medium10,
    required this.medium12,
    required this.medium13,
    required this.medium15,
    required this.bold14,
    required this.bold15,
    required this.bold18,
    required this.extraBold11,
    required this.extraBold18,
    required this.extraBold21,
    required this.regular10,
    required this.regular11,
    required this.regular12,
    required this.regular13,
    required this.regular14,
    required this.regular15,
    required this.medium16,
    required this.medium24,
    required this.bold10,
    required this.bold11,
    required this.bold12,
    required this.bold13,
    required this.bold16,
    required this.bold20,
    required this.bold23,
    required this.extraBold15,
  });
}

CAppTheme appTheme = CAppTheme(
  background: const Color(0xFFFFFFFF),
  primary: {
    10: ColorPallete.purple,
    20: ColorPallete.mediumPurple,
    30: ColorPallete.lightPurple,
  },
  grays: ColorPallete.grays,
  yellow: ColorPallete.yellow,
);

Dimens dimens = Dimens();

CTextStyles lightTextTheme = CTextStyles(
  regular10: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  regular11: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  regular13: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  regular12: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  regular14: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  regular15: TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium16: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium24: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold10: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold11: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold12: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold13: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 13.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold16: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold20: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold23: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 23.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  extraBold15: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  light10: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 10.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  light11: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 11.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  light12: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 12.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  light13: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 13.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  light14: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium10: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium11: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium12: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium13: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium14: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  medium15: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold14: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold15: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  bold18: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  extraBold11: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 11.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  extraBold18: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
  extraBold21: TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 21.0.sp,
    color: Colors.black,
    fontFamily: 'Yekan',
  ),
);

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    fontFamily: 'Yekan',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: ColorPallete.purple,
    cardColor: Colors.white,
    textTheme: const TextTheme(),
  );
}

class CTheme extends StatefulWidget {
  final Widget child;
  final CAppTheme theme;
  final CTextStyles textTheme;
  final Dimens dimens;
  const CTheme(
      {Key? key,
      required this.child,
      required this.theme,
      required this.textTheme,
      required this.dimens})
      : super(key: key);

  @override
  CThemeState createState() => CThemeState();

  static CThemeState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CustomTheme>())!.data;
  }
}

class CThemeState extends State<CTheme> {
  bool isDark = false;
  late CAppTheme theme = widget.theme;
  late CTextStyles textTheme = widget.textTheme;
  late Dimens dimens = widget.dimens;

  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      data: this,
      theme: theme,
      textTheme: textTheme,
      dimens: dimens,
      child: widget.child,
    );
  }
}

class CustomTheme extends InheritedWidget {
  // ignore: annotate_overrides, overridden_fields
  final Widget child;

  final CThemeState data;
  final CAppTheme theme;
  final CTextStyles textTheme;
  final Dimens dimens;
  const CustomTheme({
    Key? key,
    required this.child,
    required this.data,
    required this.theme,
    required this.textTheme,
    required this.dimens,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CustomTheme oldWidget) => true;
}
