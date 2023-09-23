import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/features/auth/presentations/managers/signup.manager.dart';
import 'package:salon/src/shared/widgets/custom_button.widget.dart';
import 'package:salon/src/shared/widgets/custom_textfield.widget.dart';

import '../../../../core/theme/theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupManager signupManager = SignupManager();

  @override
  void dispose() {
    signupManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: signupManager,
      child: Scaffold(
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
                child: Consumer<SignupManager>(
                  builder: (context, value, child) => SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Dimens.unitX4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ثبت نام',
                            style: CTheme.of(context).textTheme.bold23,
                          ),
                          SizedBox(height: Dimens.unitX8.h),
                          CustomTextField(
                            hint: 'نام کاربری',
                            controller: value.userNameController,
                          ),
                          SizedBox(height: Dimens.unitX4.h),
                          CustomTextField(
                            hint: 'ایمیل',
                            controller: value.emailController,
                          ),
                          SizedBox(height: Dimens.unitX4.h),
                          CustomTextField(
                            hint: 'رمز عبور',
                            controller: value.passwordController,
                            secure: true,
                          ),
                          SizedBox(height: Dimens.unitX4.h),
                          CustomTextField(
                            hint: 'تکرار رمز عبور',
                            controller: value.confirmPasswordController,
                            secure: true,
                          ),
                          SizedBox(height: Dimens.unitX8.h),
                          Row(
                            children: [
                              Flexible(
                                child: CustomButton(
                                  text: 'ثبت نام',
                                  loading: value.loading,
                                  onTap: () {
                                    value.register(context);
                                  },
                                ),
                              ),
                              SizedBox(width: Dimens.unitX4.w),
                              Flexible(
                                child: CustomButton(
                                  text: 'بازگشت',
                                  outlineMode: true,
                                  onTap: () {
                                    GoRouter.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
