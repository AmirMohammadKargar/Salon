import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/router/routes.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/profile/presentations/managers/profile.manager.dart';

import '../../../../../gen/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileManager profileManager = ProfileManager();

  @override
  void dispose() {
    profileManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: profileManager,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'پروفایل',
            style: CTheme.of(context).textTheme.medium16,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.unitX4.h,
                horizontal: Dimens.unitX4.w,
              ),
              child: Column(
                children: [
                  SizedBox(height: Dimens.unitX8.h),
                  CircleAvatar(
                    radius: Dimens.radiusX20,
                    backgroundColor: CTheme.of(context).theme.primary[10],
                    child: CircleAvatar(
                      radius: 78.r,
                      backgroundColor: Colors.white,
                      backgroundImage: (Store.user != null &&
                                  Store.user!.image != ''
                              ? CachedNetworkImageProvider(Store.user!.getImage)
                              : AssetImage(Assets.images.avatar.path))
                          as ImageProvider,
                    ),
                  ),
                  SizedBox(height: Dimens.unitX4.h),
                  Text(
                    Store.user!.username,
                    style: CTheme.of(context).textTheme.medium16,
                  ),
                  SizedBox(height: Dimens.unitX20.h),
                  ProfileItem(
                    text: 'تایم های رزو شده',
                    onTap: () {
                      GoRouter.of(context).pushNamed(Routes.orders);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Dimens.unitX2.h),
                    child: const Divider(),
                  ),
                  ProfileItem(
                    text: 'تنظیمات حساب کاربری',
                    onTap: () {
                      GoRouter.of(context).pushNamed(Routes.editUser);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Dimens.unitX2.h),
                    child: const Divider(),
                  ),
                  Consumer<ProfileManager>(
                    builder: (context, value, child) => ProfileItem(
                      text: 'خروج از حساب کاربری',
                      onTap: () {
                        value.logOut(context);
                      },
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

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Text(
            text,
            style: CTheme.of(context).textTheme.medium15,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: Dimens.unitX6.h,
          )
        ],
      ),
    );
  }
}
