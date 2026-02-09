import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    customScaffoldMessenger(
        {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.whiteBold14,
      ),
      backgroundColor: AppColor.midnightMonarch,
    ),
  );
}
