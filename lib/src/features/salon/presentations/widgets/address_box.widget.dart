import 'package:flutter/material.dart';
import 'package:salon/src/core/theme/theme.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({
    Key? key,
    required this.address,
  }) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'آدرس : ',
          style: CTheme.of(context).textTheme.medium13,
          children: [
            TextSpan(
              text: address,
              style: CTheme.of(context).textTheme.medium13.copyWith(
                    color: CTheme.of(context).theme.grays[70],
                  ),
            )
          ]),
    );
  }
}
