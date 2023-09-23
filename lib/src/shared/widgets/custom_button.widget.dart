import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    this.outlineMode = false,
    this.loading = false,
  }) : super(key: key);
  final Function? onTap;
  final String text;
  final bool outlineMode;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? null
          : () {
              onTap?.call();
            },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: Dimens.unitX12.h,
        decoration: BoxDecoration(
          color: outlineMode
              ? Colors.transparent
              : CTheme.of(context).theme.primary[10],
          borderRadius: BorderRadius.circular(Dimens.radiusX2),
          border: outlineMode
              ? Border.all(color: CTheme.of(context).theme.primary[10]!)
              : null,
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: outlineMode
                      ? CTheme.of(context).theme.primary[10]!
                      : Colors.white,
                )
              : Text(
                  text,
                  style: CTheme.of(context).textTheme.medium16.copyWith(
                      color: outlineMode
                          ? CTheme.of(context).theme.primary[10]!
                          : Colors.white),
                ),
        ),
      ),
    );
  }
}
