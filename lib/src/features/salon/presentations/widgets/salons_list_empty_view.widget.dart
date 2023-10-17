import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';

class SalonsListEmptyView extends StatelessWidget {
  const SalonsListEmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off,
            size: Dimens.unitX10.h,
          ),
          Text(
            'سالنی یافت نشد',
            style: CTheme.of(context).textTheme.bold14,
          ),
        ],
      ),
    );
  }
}
