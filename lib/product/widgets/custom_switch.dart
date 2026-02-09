import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeThumbColor: AppColor.white,
        activeTrackColor: AppColor.midnightMonarch,
        value: value,
        onChanged: onChanged);
  }
}
