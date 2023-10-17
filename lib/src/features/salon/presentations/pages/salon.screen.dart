import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/salon/presentations/managers/salon.manager.dart';
import 'package:salon/src/features/salon/presentations/widgets/address_box.widget.dart';
import 'package:salon/src/features/salon/presentations/widgets/map_button.widget.dart';
import 'package:salon/src/features/salon/presentations/widgets/service_card.widget.dart';
import 'package:salon/src/features/salon/presentations/widgets/show_reserve_time_bottom_sheet.widget.dart';
import 'package:salon/src/shared/widgets/custom_button.widget.dart';

import '../../../../../gen/assets.gen.dart';

class SalonScreen extends StatefulWidget {
  final int id;
  const SalonScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SalonScreen> createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen> {
  SalonManager salonManager = SalonManager();

  @override
  void initState() {
    super.initState();
    salonManager.initialScreen(widget.id);
  }

  @override
  void dispose() {
    salonManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: salonManager,
      child: Scaffold(
        bottomNavigationBar: Consumer<SalonManager>(
          builder: (context, value, child) => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.unitX4.w, vertical: Dimens.unitX4.h),
            child: CustomButton(
              text: 'رزو وقت',
              loading: value.placingOrder,
              onTap: () async {
                showReserveTimeBottomSheet(context, (date, reserved) {
                  Navigator.pop(context);
                  value.placeOrder(context, date, reserved);
                });
              },
            ),
          ),
        ),
        body: SafeArea(
          child: Consumer<SalonManager>(
            builder: (context, value, child) => value.loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            value.salon!.image != ''
                                ? CachedNetworkImage(
                                    imageUrl: value.salon!.image,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  )
                                : Image.asset(
                                    Assets.images.test.path,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                            PositionedDirectional(
                              top: Dimens.unitX2.h,
                              start: Dimens.unitX2.w,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  width: 35.h,
                                  height: 35.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black45,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: Dimens.unitX5.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimens.unitX6.h),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.unitX4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    value.salon!.name,
                                    style: CTheme.of(context).textTheme.bold20,
                                  ),
                                  value.salon!.map != ''
                                      ? MapButton(
                                          map: value.salon!.map,
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                              SizedBox(height: Dimens.unitX2.h),
                              ExpandableText(
                                value.salon!.description,
                                style: CTheme.of(context)
                                    .textTheme
                                    .medium14
                                    .copyWith(
                                        color:
                                            CTheme.of(context).theme.grays[70]),
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                linkColor: CTheme.of(context).theme.primary[10],
                                expandText: 'بیشتر',
                                collapseText: 'بستن',
                              ),
                              SizedBox(height: Dimens.unitX2.h),
                              const Divider(),
                              SizedBox(height: Dimens.unitX2.h),
                              AddressBox(
                                address: value.salon!.address,
                              ),
                              SizedBox(height: Dimens.unitX8.h),
                              Consumer<SalonManager>(
                                builder: (context, value, child) =>
                                    AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: value.services.isEmpty
                                      ? const SizedBox.shrink()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'لطفا سرویس های مورد نظر خود را انتخاب نمایید :',
                                              style: CTheme.of(context)
                                                  .textTheme
                                                  .medium16,
                                            ),
                                            SizedBox(height: Dimens.unitX4.h),
                                            ...List.generate(
                                              value.services.length,
                                              (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: Dimens.unitX4.h),
                                                child: ServiceCard(
                                                  selecetd: false,
                                                  service:
                                                      value.services[index],
                                                  onTap: (service) {
                                                    value
                                                        .selectService(service);
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                              SizedBox(height: Dimens.unitX8.h),
                              Consumer<SalonManager>(
                                builder: (context, value, child) =>
                                    AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: value.selectedServices.isEmpty
                                      ? const SizedBox.shrink()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'سرویس های انتخاب شده:',
                                              style: CTheme.of(context)
                                                  .textTheme
                                                  .medium16,
                                            ),
                                            SizedBox(height: Dimens.unitX4.h),
                                            ...List.generate(
                                              value.selectedServices.length,
                                              (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: Dimens.unitX4.h),
                                                child: ServiceCard(
                                                  selecetd: true,
                                                  service: value
                                                      .selectedServices[index],
                                                  onTap: (service) {
                                                    value
                                                        .selectService(service);
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ],
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
