import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/salon/presentations/widgets/reserve_time_box.widget.dart';
import 'package:salon/src/shared/enums/reserve_time_box_type.enum.dart';
import 'package:salon/src/shared/enums/reserved_hour.enum.dart';
import 'package:salon/src/shared/widgets/custom_button.widget.dart';

void showReserveTimeBottomSheet(BuildContext context, Function onTap) async {
  var time = Jalali.now();
  var reserved = ReservedHour.eight;
  await showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.radiusX6),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.unitX4.w, vertical: Dimens.unitX4.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'زمان های موجود برای رزو : ',
                style: CTheme.of(context).textTheme.bold16,
              ),
              SizedBox(height: Dimens.unitX8.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      var res = await showPersianDatePicker(
                        context: context,
                        initialDate: Jalali.now(),
                        firstDate: Jalali(1385, 8),
                        lastDate: Jalali(1450, 9),
                      );
                      if (res != null) {
                        setState(() {
                          time = res;
                        });
                      }
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: CTheme.of(context).theme.primary[10]!),
                        borderRadius: BorderRadius.circular(Dimens.radiusX1),
                      ),
                      child: Center(
                        child: Text(
                          'انتخاب تاریخ',
                          style: CTheme.of(context).textTheme.medium13.copyWith(
                                color: CTheme.of(context).theme.primary[10],
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimens.unitX5.w,
                  ),
                  Text(
                    time.formatFullDate(),
                    style: CTheme.of(context).textTheme.medium15,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimens.unitX2.h),
                child: const Divider(),
              ),
              Text(
                'زمان ها',
                style: CTheme.of(context).textTheme.medium15,
              ),
              SizedBox(height: Dimens.unitX3.h),
              Wrap(
                spacing: Dimens.unitX1.w,
                runSpacing: Dimens.unitX2.h,
                children: [
                  ...List.generate(
                    ReservedHour.values.length,
                    (index) => ReserveTimeBox(
                      onTap: () {
                        setState(() {
                          reserved = ReservedHour.values[index];
                        });
                      },
                      text: ReservedHour.values[index].name,
                      type: ReservedHour.values[index].value == reserved.value
                          ? ReserveTimeBoxType.reserved
                          : ReserveTimeBoxType.open,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimens.unitX8.h,
              ),
              CustomButton(
                text: 'تایید',
                onTap: () {
                  onTap(time, reserved);
                },
              ),
              SizedBox(
                height: Dimens.unitX8.h,
              ),
            ],
          ),
        );
      });
    },
  );
}
