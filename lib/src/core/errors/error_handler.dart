import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/src/core/errors/failures.dart';
import 'package:salon/src/core/router/router.dart';
import 'package:salon/src/core/router/routes.dart';

import '../theme/color_pallete.dart';
import '../theme/theme.dart';

enum ErrorType {
  none,
  server,
  app,
  authentication,
  network;
}

class ErrorHandler {
  static ErrorType getErrorType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
      case NotFoundFailure:
      case BadRequestFailure:
      case BadGatewayFailure:
      case MaintainServerFailure:
      case InternalServerFailure:
        return ErrorType.server;

      case AuthenticationFailure:
        return ErrorType.authentication;

      case AppFailure:
        return ErrorType.app;

      case NetworkFailure:
        return ErrorType.network;

      default:
        return ErrorType.app;
    }
  }

  static String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return (failure as ServerFailure).message;

      case NotFoundFailure:
        return (failure as NotFoundFailure).message;

      case BadRequestFailure:
        return (failure as BadRequestFailure).message;

      case BadGatewayFailure:
        return (failure as BadGatewayFailure).message;

      case MaintainServerFailure:
        return (failure as MaintainServerFailure).message;

      case InternalServerFailure:
        return (failure as InternalServerFailure).message;

      case AuthenticationFailure:
        return (failure as AuthenticationFailure).message;

      case AppFailure:
        return (failure as AppFailure).message;

      case NetworkFailure:
        return 'خطا در ارتباط با اینترنت';

      default:
        return 'خطا';
    }
  }

  static Map<bool, String>? handleActionFailureError(
      Failure failure, BuildContext context) {
    var type = ErrorHandler.getErrorType(failure);
    var errorMessage = ErrorHandler.getErrorMessage(failure);
    var hasError = true;
    if (type == ErrorType.authentication) {
      ErrorHandler.showErrorSnack(
          context: AppRouter.rootNavigatorKey.currentContext ?? context,
          message: errorMessage);
      GoRouter.of(AppRouter.rootNavigatorKey.currentContext ?? context)
          .goNamed(Routes.login);
      return null;
    }
    return {hasError: errorMessage};
  }

  static void showErrorSnack(
      {required BuildContext context, Failure? failure, String? message}) {
    var finalMessage = '';
    if (message != null) {
      finalMessage = message;
    } else if (failure != null) {
      finalMessage = getErrorMessage(failure);
    }
    ScaffoldMessenger.of(AppRouter.rootNavigatorKey.currentContext!)
        .showSnackBar(
      SnackBar(
        backgroundColor: ColorPallete.red,
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
              Icons.error_outline,
              color: Colors.white,
              size: Dimens.unitX6.w,
            ),
            SizedBox(
              width: Dimens.unitX4.w,
            ),
            Expanded(
              child: Text(
                finalMessage,
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
