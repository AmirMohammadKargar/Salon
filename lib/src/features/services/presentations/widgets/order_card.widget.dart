import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/services/domain/entities/order.entity.dart';
import 'package:salon/src/shared/enums/reserved_hour.enum.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusX3),
        color: CTheme.of(context).theme.background,
        boxShadow: [
          BoxShadow(
            color: CTheme.of(context).theme.primary[10]!.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 4,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimens.unitX2.h,
        horizontal: Dimens.unitX4.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'سالن : ${order.salon!.name}',
            style: CTheme.of(context).textTheme.medium15,
          ),
          Text(
            'ساعت : ${ReservedHour.getName(order.reservedHour)}',
            style: CTheme.of(context).textTheme.medium15,
          ),
          Text(
            'تاریخ : ${order.date()}',
            style: CTheme.of(context).textTheme.medium15,
          ),
          order.isExpire()
              ? Text(
                  'منقضی شده',
                  style: CTheme.of(context)
                      .textTheme
                      .medium15
                      .copyWith(color: Colors.red),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
