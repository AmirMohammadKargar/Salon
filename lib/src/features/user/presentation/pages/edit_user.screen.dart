import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/store/store.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/user/presentation/managers/edit_user.manager.dart';
import 'package:salon/src/shared/constants/urls.dart';
import 'package:salon/src/shared/widgets/custom_button.widget.dart';
import 'package:salon/src/shared/widgets/custom_textfield.widget.dart';

import '../../../../../gen/assets.gen.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  EditUserManager editUserManager = EditUserManager();

  @override
  void initState() {
    super.initState();
    editUserManager.initialScreen();
  }

  @override
  void dispose() {
    editUserManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: editUserManager,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ویرایش پروفایل',
            style: CTheme.of(context).textTheme.medium16,
          ),
        ),
        body: SafeArea(
          child: Consumer<EditUserManager>(
            builder: (context, value, child) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.unitX4.h,
                  horizontal: Dimens.unitX4.w,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        value.uploadImage(context);
                      },
                      child: CircleAvatar(
                        radius: Dimens.radiusX20,
                        backgroundColor: CTheme.of(context).theme.primary[10],
                        child: value.uploading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CircleAvatar(
                                radius: 78.r,
                                backgroundColor: Colors.white,
                                backgroundImage: (value.image != ''
                                        ? CachedNetworkImageProvider(
                                            Urls.baseUrl + value.image)
                                        : Store.user!.image != ''
                                            ? CachedNetworkImageProvider(
                                                Store.user!.getImage)
                                            : AssetImage(
                                                Assets.images.avatar.path))
                                    as ImageProvider,
                              ),
                      ),
                    ),
                    SizedBox(height: Dimens.unitX8.h),
                    CustomTextField(
                      hint: 'نام کاربری',
                      controller: value.usernameController,
                    ),
                    SizedBox(height: Dimens.unitX4.h),
                    CustomTextField(
                      hint: 'نام',
                      controller: value.firstnameController,
                    ),
                    SizedBox(height: Dimens.unitX4.h),
                    CustomTextField(
                      hint: 'نام خانوادگی',
                      controller: value.lastnameController,
                    ),
                    SizedBox(height: Dimens.unitX4.h),
                    CustomTextField(
                      hint: 'ایمیل',
                      controller: value.emailController,
                    ),
                    SizedBox(height: Dimens.unitX16.h),
                    CustomButton(
                      text: 'ویرایش',
                      loading: value.updating,
                      onTap: () {
                        value.updateUser(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
