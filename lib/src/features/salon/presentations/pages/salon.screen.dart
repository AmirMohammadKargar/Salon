import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/salon/presentations/managers/salon.manager.dart';
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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.unitX4.w, vertical: Dimens.unitX4.h),
          child: CustomButton(
            text: 'رزو ساعت (۴۰,۰۰ تومان)',
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.radiusX6),
                ),
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.unitX4.w, vertical: Dimens.unitX4.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'زمان های موجود برای رزو: ',
                          style: CTheme.of(context).textTheme.bold16,
                        ),
                        SizedBox(
                          height: Dimens.unitX8.h,
                        ),
                        Wrap(
                          spacing: Dimens.unitX1.w,
                          runSpacing: Dimens.unitX2.h,
                          children: const [
                            ReserveTimeBox(
                              text: '13:00',
                              type: ReserveTimeBoxType.open,
                            ),
                            ReserveTimeBox(
                              text: '14:00',
                              type: ReserveTimeBoxType.open,
                            ),
                            ReserveTimeBox(
                              text: '15:00',
                              type: ReserveTimeBoxType.reserved,
                            ),
                            ReserveTimeBox(
                              text: '16:00',
                              type: ReserveTimeBoxType.disable,
                            ),
                            ReserveTimeBox(
                              text: '17:00',
                              type: ReserveTimeBoxType.disable,
                            ),
                            ReserveTimeBox(
                              text: '18:00',
                              type: ReserveTimeBoxType.open,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimens.unitX8.h,
                        ),
                        const CustomButton(text: 'تایید'),
                        SizedBox(
                          height: Dimens.unitX8.h,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
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
                              Text(
                                value.salon!.name,
                                style: CTheme.of(context).textTheme.bold20,
                              ),
                              SizedBox(
                                height: Dimens.unitX2.h,
                              ),
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
                              SizedBox(height: Dimens.unitX8.h),
                              Text(
                                'سرویس های انتخاب شده:',
                                style: CTheme.of(context).textTheme.medium16,
                              ),
                              SizedBox(height: Dimens.unitX4.h),
                              const ServiceCard(selecetd: true),
                              SizedBox(height: Dimens.unitX8.h),
                              Text(
                                'لطفا سرویس های مورد نظر خود را انتخاب نمایید :',
                                style: CTheme.of(context).textTheme.medium16,
                              ),
                              SizedBox(height: Dimens.unitX4.h),
                              ...List.generate(
                                4,
                                (index) => Padding(
                                  padding:
                                      EdgeInsets.only(bottom: Dimens.unitX4.h),
                                  child: const ServiceCard(
                                    selecetd: false,
                                  ),
                                ),
                              )
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

enum ReserveTimeBoxType {
  disable,
  reserved,
  open;
}

class ReserveTimeBox extends StatelessWidget {
  const ReserveTimeBox({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);
  final ReserveTimeBoxType type;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          '13:00',
          style: CTheme.of(context).textTheme.medium15.copyWith(
                color: type == ReserveTimeBoxType.reserved
                    ? Colors.white
                    : type == ReserveTimeBoxType.open
                        ? CTheme.of(context).theme.primary[10]
                        : CTheme.of(context).theme.grays[90],
              ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.selecetd,
  }) : super(key: key);
  final bool selecetd;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimens.unitX13.h,
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
      padding: EdgeInsets.symmetric(horizontal: Dimens.unitX2.w),
      child: Row(
        children: [
          SizedBox(
            width: Dimens.unitX5.h,
            height: Dimens.unitX5.h,
            child: Checkbox(
              value: selecetd,
              activeColor: CTheme.of(context).theme.primary[10],
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            width: Dimens.unitX2.w,
          ),
          Text(
            'اصلاح ریش',
            style: CTheme.of(context).textTheme.light14.copyWith(
                  color: CTheme.of(context).theme.grays[70],
                ),
          ),
          const Spacer(),
          Text(
            '۴۰,۰۰۰ تومان',
            style: CTheme.of(context).textTheme.medium14.copyWith(
                  color: CTheme.of(context).theme.grays[70],
                ),
          )
        ],
      ),
    );
  }
}
