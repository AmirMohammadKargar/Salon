import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    this.secure = false,
    this.onChange,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hint;
  final Function? onChange;
  final bool secure;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.radiusX2),
      child: TextField(
        onChanged: (value) {
          onChange?.call(value);
        },
        obscureText: secure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: CTheme.of(context).theme.grays[50],
          border: InputBorder.none,
        ),
        cursorColor: CTheme.of(context).theme.primary[10],
      ),
    );
  }
}
