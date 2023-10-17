import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/services/domain/entities/service.entity.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.selecetd,
    required this.service,
    this.onTap,
  }) : super(key: key);
  final bool selecetd;
  final ServiceEntity service;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(service);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusX3),
          color: selecetd
              ? CTheme.of(context).theme.primary[30]
              : CTheme.of(context).theme.background,
          border: selecetd
              ? Border.all(color: CTheme.of(context).theme.primary[10]!)
              : null,
          boxShadow: [
            BoxShadow(
              color: CTheme.of(context).theme.primary[10]!.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 4,
            )
          ],
        ),
        padding: EdgeInsetsDirectional.only(end: Dimens.unitX2.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(
                  Dimens.radiusX3,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: service.image,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: Dimens.unitX2.w,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimens.unitX2.h),
                  child: Text(
                    '${service.name}\n${service.description}',
                    style: CTheme.of(context).textTheme.light14.copyWith(
                          color: CTheme.of(context).theme.grays[70],
                        ),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Dimens.unitX5.h,
              height: Dimens.unitX5.h,
              child: Checkbox(
                value: selecetd,
                activeColor: CTheme.of(context).theme.primary[10],
                onChanged: (value) {
                  onTap?.call(service);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
