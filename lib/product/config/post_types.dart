import 'package:easy_localization/easy_localization.dart';
import '../../core/init/lang/locale_keys.g.dart';

enum PostType {
  post,
  story,
  messaging,
  personal;

  String get label {
    return switch (this) {
      PostType.post =>
        LocaleKeys.GenerateVisualView_PostType_PostTypeOptions_post.tr(),
      PostType.story =>
        LocaleKeys.GenerateVisualView_PostType_PostTypeOptions_story.tr(),
      PostType.messaging =>
        LocaleKeys.GenerateVisualView_PostType_PostTypeOptions_messaging.tr(),
      PostType.personal =>
        LocaleKeys.GenerateVisualView_PostType_PostTypeOptions_personal.tr(),
    };
  }
}
