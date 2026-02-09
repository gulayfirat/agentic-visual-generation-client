import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';
import '../../core/constants/app_color.dart';

enum PostTextStyleType {
  modern,
  minimal,
  handwritten,
  classic,
  rounded,
  bold;

  String get label =>
      LocaleKeys.GenerateVisualView_VisualText_TextStyle_TextStyleItems +
      "_$name".tr();

  TextStyle getStyle(bool isSelected) {
    final color = isSelected ? AppColor.midnightMonarch : AppColor.naturalism;

    return switch (this) {
      PostTextStyleType.handwritten =>
        GoogleFonts.pacifico(fontSize: 16, color: color),
      PostTextStyleType.classic =>
        GoogleFonts.playfairDisplay(fontSize: 16, color: color),
      PostTextStyleType.rounded =>
        GoogleFonts.poppins(fontSize: 16, color: color),
      PostTextStyleType.bold => GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.bold, color: color),
      PostTextStyleType.minimal => GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: color),
      PostTextStyleType.modern => GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w500, color: color),
    };
  }
}
