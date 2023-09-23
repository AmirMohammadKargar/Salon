import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/router/routes.dart';

import '../../../../core/theme/theme.dart';
import '../../../../shared/widgets/custom_button.widget.dart';
import '../../../../shared/widgets/custom_textfield.widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PositionedDirectional(
              top: -Dimens.unitX7.h,
              end: -Dimens.unitX12.w,
              child: Container(
                width: 200.h,
                height: 200.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.bottomStart,
                    end: AlignmentDirectional.topEnd,
                    colors: [
                      CTheme.of(context).theme.primary[10]!,
                      CTheme.of(context).theme.primary[10]!.withOpacity(0.7),
                      CTheme.of(context).theme.primary[10]!.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              top: -Dimens.unitX7.h,
              start: -Dimens.unitX12.w,
              child: Container(
                width: 100.h,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.bottomEnd,
                    end: AlignmentDirectional.topStart,
                    colors: [
                      CTheme.of(context).theme.primary[10]!,
                      CTheme.of(context).theme.primary[10]!.withOpacity(0.7),
                      CTheme.of(context).theme.primary[10]!.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.unitX4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'سالن',
                          style: CTheme.of(context)
                              .textTheme
                              .extraBold21
                              .copyWith(fontSize: 48.sp),
                        ),
                      ),
                      SizedBox(height: Dimens.unitX12.h),
                      Text(
                        'ورود',
                        style: CTheme.of(context).textTheme.bold23,
                      ),
                      SizedBox(height: Dimens.unitX8.h),
                      const CustomTextField(
                        hint: 'ایمیل',
                      ),
                      SizedBox(height: Dimens.unitX4.h),
                      const CustomTextField(
                        hint: 'رمز عبور',
                      ),
                      SizedBox(height: Dimens.unitX8.h),
                      CustomButton(
                        text: 'ورود',
                        onTap: () {
                          GoRouter.of(context).goNamed(Routes.salonList);
                        },
                      ),
                      SizedBox(height: Dimens.unitX8.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(Routes.signup);
                          },
                          behavior: HitTestBehavior.opaque,
                          child: RichText(
                            text: TextSpan(
                              text: 'حساب کابری ندارید؟ ',
                              children: [
                                TextSpan(
                                  text: 'ثبت نام کنید',
                                  style: CTheme.of(context)
                                      .textTheme
                                      .medium16
                                      .copyWith(
                                        color: CTheme.of(context)
                                            .theme
                                            .primary[10],
                                      ),
                                )
                              ],
                              style: CTheme.of(context).textTheme.medium16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
