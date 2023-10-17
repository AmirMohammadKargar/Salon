import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/router/router.dart';
import 'package:salon/src/core/theme/theme.dart';

class AppSnackBar {
  static void showSuccessSnack(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(AppRouter.rootNavigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.unitX4.w,
          vertical: Dimens.unitX4.h,
        ),
        dismissDirection: DismissDirection.horizontal,
        content: Row(
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
              size: Dimens.unitX6.w,
            ),
            SizedBox(
              width: Dimens.unitX4.w,
            ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
                maxLines: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
