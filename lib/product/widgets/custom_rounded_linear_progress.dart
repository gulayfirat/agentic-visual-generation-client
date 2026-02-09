import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/extension/context/context_extension.dart';

class RoundedLinearProgress extends StatelessWidget {
  final double value; // 0.0 - 1.0

  const RoundedLinearProgress({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 5,
          decoration: BoxDecoration(
            color: AppColor.lynxWhite,
            borderRadius: context.border35Radius,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * value,
              decoration: BoxDecoration(
                color: AppColor.midnightMonarch,
                borderRadius: context.border35Radius,
              ),
            ),
          ),
        );
      },
    );
  }
}
