import 'package:flutter/material.dart';
import 'package:postgen_app/core/extension/widget/widget_extension.dart';

import '../../core/constants/app_color.dart';
import '../../core/extension/context/context_extension.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColor.blueberryWhip)
        .pOnly(bottom: context.normalVal);
  }
}
