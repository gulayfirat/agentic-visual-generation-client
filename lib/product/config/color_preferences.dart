import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';

enum ColorToneType {
  pastel,
  bw,
  dark,
  light,
  warm,
  purple,
  blue,
  green,
  pink;

  String get title {
    return switch (this) {
      ColorToneType.pastel =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_pastel.tr(),
      ColorToneType.bw =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_BW.tr(),
      ColorToneType.dark =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_dark.tr(),
      ColorToneType.light =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_light.tr(),
      ColorToneType.warm =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_warm.tr(),
      ColorToneType.purple =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_purple.tr(),
      ColorToneType.blue =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_blue.tr(),
      ColorToneType.green =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_green.tr(),
      ColorToneType.pink =>
        LocaleKeys.GenerateVisualView_ColorTone_ColorToneItems_pink.tr(),
    };
  }

  List<Color> get gradient {
    return switch (this) {
      ColorToneType.pastel => [
          const Color(0xFFFFF6C3),
          const Color(0xFFE6F0FF)
        ],
      ColorToneType.bw => [const Color(0xFFE5E7EB), const Color(0xFF111827)],
      ColorToneType.dark => [const Color(0xFF1F1F1F), const Color(0xFF000000)],
      ColorToneType.light => [const Color(0xFFF9FAFB), const Color(0xFFE5E7EB)],
      ColorToneType.warm => [const Color(0xFFFDE68A), const Color(0xFFF59E0B)],
      ColorToneType.purple => [
          const Color(0xFFC084FC),
          const Color(0xFF7C3AED)
        ],
      ColorToneType.blue => [const Color(0xFF60A5FA), const Color(0xFF2563EB)],
      ColorToneType.green => [const Color(0xFF6EE7B7), const Color(0xFF059669)],
      ColorToneType.pink => [const Color(0xFFF9A8D4), const Color(0xFFEC4899)],
    };
  }

  Color get borderColor {
    return switch (this) {
      ColorToneType.pastel => const Color(0xFFE6E6E6),
      ColorToneType.bw => const Color(0xFF111827),
      ColorToneType.dark => const Color(0xFF1F1F1F),
      ColorToneType.light => const Color(0xFFD1D5DB),
      ColorToneType.warm => const Color(0xFFF59E0B),
      ColorToneType.purple => const Color(0xFF7C3AED),
      ColorToneType.blue => const Color(0xFF2563EB),
      ColorToneType.green => const Color(0xFF059669),
      ColorToneType.pink => const Color(0xFFEC4899),
    };
  }
}
