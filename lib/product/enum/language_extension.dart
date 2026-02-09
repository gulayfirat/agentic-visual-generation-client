import 'package:easy_localization/easy_localization.dart';
import '../../core/enums/language_items.dart';
import '../../core/init/lang/locale_keys.g.dart';

extension LanguageItemsExtension on LanguageItems {
  String getLocalLanguage() {
    switch (this) {
      case LanguageItems.tr:
        return LocaleKeys.HomeView_trLang.tr();
      case LanguageItems.en:
        return LocaleKeys.HomeView_enLang.tr();
    }
  }
}
