import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:salon/gen/assets.gen.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';

class SalonCard extends StatelessWidget {
  const SalonCard({
    Key? key,
    required this.salon,
  }) : super(key: key);
  final SalonEntity salon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.salon,
            pathParameters: {'id': salon.id.toString()});
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 136.h,
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
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(Dimens.radiusX3),
                  bottomStart: Radius.circular(Dimens.radiusX3),
                ),
                child: salon.image != ''
                    ? CachedNetworkImage(
                        imageUrl: salon.image,
                        fit: BoxFit.cover,
                        height: 136.h,
                      )
                    : Image.asset(
                        Assets.images.test.path,
                        fit: BoxFit.cover,
                        height: 136.h,
                      ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.unitX2.w, vertical: Dimens.unitX2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      salon.name,
                      style: CTheme.of(context).textTheme.medium16.copyWith(
                            color: CTheme.of(context).theme.grays[90],
                          ),
                    ),
                    SizedBox(height: Dimens.unitX2.h),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: CTheme.of(context).theme.grays[70],
                            size: Dimens.unitX5.h,
                          ),
                          SizedBox(width: Dimens.unitX1.w),
                          Flexible(
                            child: Text(
                              salon.address,
                              style: CTheme.of(context)
                                  .textTheme
                                  .light13
                                  .copyWith(
                                    color: CTheme.of(context).theme.grays[70],
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: CTheme.of(context).theme.grays[70],
                        size: Dimens.unitX4.h,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
