import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/splash/presentations/managers/splash.manager.dart';

import '../../../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashManager splashManager = SplashManager();

  @override
  void initState() {
    super.initState();
    splashManager.initialScreen(context);
  }

  @override
  void dispose() {
    splashManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: splashManager,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Lottie.asset(
                  Assets.animations.splash.path,
                  frameRate: FrameRate.max,
                  repeat: false,
                ),
                const Spacer(),
                Consumer<SplashManager>(
                  builder: (context, value, child) =>
                      value.loginErrorMessage != ''
                          ? GestureDetector(
                              onTap: () {
                                value.getUser(context);
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    value.loginErrorMessage,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: Dimens.unitX5.w),
                                  Icon(Icons.refresh, size: Dimens.unitX5.h)
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
