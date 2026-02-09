import 'package:flutter/material.dart';
import 'package:postgen_app/core/constants/app_text_styles.dart';
import '../../core/constants/app_color.dart';
import '../../core/extension/context/context_extension.dart';
import '../../core/extension/widget/widget_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? buttonText;
  final dynamic Function()? onTap;
  final bool isFilled;
  final Widget? icon;
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isFilled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width * 0.12,
      width: context.width,
      decoration: BoxDecoration(
          color: isFilled ? AppColor.midnightMonarch : null,
          border: Border.all(
              color: isFilled ? Colors.transparent : AppColor.midnightMonarch),
          borderRadius: context.border12Radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(buttonText ?? "",
              style: isFilled
                  ? AppTextStyle.whiteBold14
                  : AppTextStyle.midnightMonarchBold14),
          SizedBox(width: icon != null ? context.width * 0.02 : 0),
          Visibility(
              visible: icon != null, child: icon ?? const SizedBox.shrink()),
        ],
      ),
    ).gestureDetector(onTap: onTap);
  }
}
