import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/services/presentations/managers/orders.manager.dart';
import 'package:salon/src/features/services/presentations/widgets/order_card.widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrdersManager ordersManager = OrdersManager();

  @override
  void initState() {
    super.initState();
    ordersManager.initialScreen();
  }

  @override
  void dispose() {
    ordersManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ordersManager,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'تایم های رزو شده',
            style: CTheme.of(context).textTheme.medium16,
          ),
        ),
        body: SafeArea(
          child: Consumer<OrdersManager>(
            builder: (context, value, child) => value.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : value.orders.isEmpty
                    ? Center(
                        child: Text(
                          'تایم رزو شده ای وجود ندارد',
                          style: CTheme.of(context).textTheme.medium14,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimens.unitX4.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimens.unitX4.h,
                              ),
                              ...List.generate(
                                value.orders.length,
                                (index) => Padding(
                                  padding:
                                      EdgeInsets.only(bottom: Dimens.unitX4.h),
                                  child: OrderCard(
                                    order: value.orders[index],
                                  ),
                                ),
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
