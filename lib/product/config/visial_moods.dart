import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';

enum VisualMood {
  calm,
  inspirational,
  minimalist,
  emotional,
  spiritual,
  bold;

  String get title {
    return switch (this) {
      VisualMood.calm =>
        LocaleKeys.GenerateVisualView_VisualMood_VisualMoodItems_calm.tr(),
      VisualMood.inspirational => LocaleKeys
          .GenerateVisualView_VisualMood_VisualMoodItems_inspirational.tr(),
      VisualMood.minimalist => LocaleKeys
          .GenerateVisualView_VisualMood_VisualMoodItems_minimalist.tr(),
      VisualMood.emotional =>
        LocaleKeys.GenerateVisualView_VisualMood_VisualMoodItems_emotional.tr(),
      VisualMood.spiritual =>
        LocaleKeys.GenerateVisualView_VisualMood_VisualMoodItems_spiritual.tr(),
      VisualMood.bold =>
        LocaleKeys.GenerateVisualView_VisualMood_VisualMoodItems_bold.tr(),
    };
  }

  IconData get icon {
    return switch (this) {
      VisualMood.calm => Icons.local_florist,
      VisualMood.inspirational => Icons.lightbulb,
      VisualMood.minimalist => Icons.crop_square,
      VisualMood.emotional => Icons.sentiment_satisfied,
      VisualMood.spiritual => Icons.self_improvement,
      VisualMood.bold => Icons.flash_on,
    };
  }
}
