import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon/src/core/theme/theme.dart';
import 'package:salon/src/features/map/presentation/pages/map.screen.dart';

class MapButton extends StatelessWidget {
  const MapButton({
    Key? key,
    required this.map,
  }) : super(key: key);
  final String map;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: CTheme.of(context).theme.primary[10]!,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return MapScreen(map: map);
            },
          ));
        },
        child: Icon(
          Icons.location_pin,
          color: CTheme.of(context).theme.primary[10],
          size: Dimens.unitX6.h,
        ),
      ),
    );
  }
}
