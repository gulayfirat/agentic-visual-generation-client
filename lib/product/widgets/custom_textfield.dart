import 'package:flutter/material.dart';
import 'package:postgen_app/core/constants/app_text_styles.dart';
import 'package:postgen_app/core/extension/widget/widget_extension.dart';
import '../../core/constants/app_color.dart';
import '../../core/extension/context/context_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.maxLength,
    required this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final int? maxLength;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelText ?? "",
          style: AppTextStyle.blackBold14,
        ).pConstBottom(context),
        TextFormField(
          maxLength: maxLength,
          controller: controller,
          maxLines: 5,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: context.border12Radius,
                  borderSide:
                      BorderSide(color: AppColor.midnightMonarch, width: 0.1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: context.border12Radius,
                  borderSide:
                      BorderSide(color: AppColor.midnightMonarch, width: 1)),
              hintText: hintText,
              hintStyle:
                  TextStyle(color: AppColor.midnightMonarch.withOpacity(0.5))),
        ),
      ],
    );
  }
}
