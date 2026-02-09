import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  //Bold TextStyle
  static TextStyle whiteBold14 = const TextStyle(
    color: AppColor.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle midnightMonarchBold14 = const TextStyle(
    color: AppColor.midnightMonarch,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle whiteBold18 = const TextStyle(
    color: AppColor.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle whiteBold28 = const TextStyle(
    color: AppColor.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static TextStyle voluptuousVioletBold14 = const TextStyle(
      color: AppColor.voluptuousViolet,
      fontSize: 14,
      fontWeight: FontWeight.bold);

  static TextStyle blackBold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );

  static TextStyle blackBold14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.black,
  );
//Regular
  static TextStyle whiteRegular10 = const TextStyle(
    color: AppColor.white,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static TextStyle voluptuousVioletRegular14 = const TextStyle(
    color: AppColor.voluptuousViolet,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackRegular12 = const TextStyle(
    color: AppColor.black,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle midnightMonarchRegular14 = const TextStyle(
    color: AppColor.midnightMonarch,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
