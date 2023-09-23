import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/salon/domain/entities/salon.entity.dart';
import 'package:salon/src/features/salon/presentations/managers/salons_list.manager.dart';
import 'package:salon/src/shared/widgets/custom_textfield.widget.dart';

import '../../../../../gen/assets.gen.dart';

class SalonsListScreen extends StatefulWidget {
  const SalonsListScreen({Key? key}) : super(key: key);

  @override
  State<SalonsListScreen> createState() => _SalonsListScreenState();
}

class _SalonsListScreenState extends State<SalonsListScreen> {
  SalonsListManager salonsListManager = SalonsListManager();

  @override
  void initState() {
    super.initState();
    salonsListManager.initialScreen();
  }

  @override
  void dispose() {
    salonsListManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: salonsListManager,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimens.unitX4.h, horizontal: Dimens.unitX4.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: Dimens.radiusX6,
                        backgroundColor: CTheme.of(context).theme.primary[10],
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: Dimens.unitX4.w),
                      Expanded(
                        child: Text(
                          'خوش اومدی, امیرمحمد!',
                          style: CTheme.of(context).textTheme.medium16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.person_outline, size: Dimens.unitX8.h)
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: Dimens.unitX8.h)),
                const SliverToBoxAdapter(
                  child: CustomTextField(
                    hint: 'جستجو سالن ...',
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: Dimens.unitX6.h)),
                SliverToBoxAdapter(
                  child: Text(
                    'سالن ها',
                    style: CTheme.of(context).textTheme.bold18,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: Dimens.unitX6.h)),
                Consumer<SalonsListManager>(
                  builder: (context, value, child) => PagedSliverList.separated(
                    pagingController: value.salonController,
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, item, index) {
                        return SalonCard(
                          salon: item as SalonEntity,
                        );
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: Dimens.unitX4.h),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                    SizedBox(
                      height: Dimens.unitX2.h,
                    ),
                    Flexible(
                      child: Row(
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
                    const Spacer(),
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
