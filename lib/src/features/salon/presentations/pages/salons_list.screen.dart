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
import 'package:salon/src/features/salon/presentations/widgets/salon_card.widget.dart';
import 'package:salon/src/features/salon/presentations/widgets/salons_list_empty_view.widget.dart';
import 'package:salon/src/shared/widgets/custom_textfield.widget.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/store/store.dart';

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
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                            radius: 23.r,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                (Store.user != null && Store.user!.image != ''
                                        ? CachedNetworkImageProvider(
                                            Store.user!.getImage)
                                        : AssetImage(Assets.images.avatar.path))
                                    as ImageProvider,
                          ),
                        ),
                        SizedBox(width: Dimens.unitX4.w),
                        Expanded(
                          child: Text(
                            Store.user != null
                                ? 'خوش اومدی, ${Store.user!.username} !'
                                : '',
                            style: CTheme.of(context).textTheme.medium16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pushNamed(Routes.profile);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: CTheme.of(context).theme.primary[10]!),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(Dimens.unitX1.h),
                            child: Icon(
                              Icons.person,
                              size: Dimens.unitX6.h,
                              color: CTheme.of(context).theme.primary[10],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: Dimens.unitX8.h)),
                  SliverToBoxAdapter(
                    child: Consumer<SalonsListManager>(
                      builder: (context, value, child) => CustomTextField(
                        hint: 'جستجو سالن ...',
                        controller: value.searchController,
                        onChange: (val) {
                          value.search();
                        },
                      ),
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
                    builder: (context, value, child) =>
                        PagedSliverList.separated(
                      pagingController: value.salonController,
                      builderDelegate: PagedChildBuilderDelegate(
                        noItemsFoundIndicatorBuilder: (context) =>
                            const SalonsListEmptyView(),
                        itemBuilder: (context, item, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: SalonCard(
                              salon: item as SalonEntity,
                            ),
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
      ),
    );
  }
}
