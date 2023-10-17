import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/shared/enums/reserve_time_box_type.enum.dart';

class ReserveTimeBox extends StatelessWidget {
  const ReserveTimeBox({
    Key? key,
    required this.type,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final ReserveTimeBoxType type;
  final String text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: 80.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusX1),
          color: type == ReserveTimeBoxType.reserved
              ? CTheme.of(context).theme.primary[10]
              : type == ReserveTimeBoxType.open
                  ? Colors.transparent
                  : Colors.grey[300],
          border: type == ReserveTimeBoxType.open
              ? Border.all(color: CTheme.of(context).theme.primary[10]!)
              : null,
        ),
        child: Center(
          child: Text(
            text,
            style: CTheme.of(context).textTheme.medium15.copyWith(
                  color: type == ReserveTimeBoxType.reserved
                      ? Colors.white
                      : type == ReserveTimeBoxType.open
                          ? CTheme.of(context).theme.primary[10]
                          : CTheme.of(context).theme.grays[90],
                ),
          ),
        ),
      ),
    );
  }
}
