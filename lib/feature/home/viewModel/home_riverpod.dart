import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/enums/loading_status.dart';
import '../../../core/base/baseService/base_cache_service.dart';
import '../../../core/enums/language_items.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/manager/language_manager.dart';
import '../../../model/visualModel/visualCacheModel/visual_cache_model.dart';
import '../../../product/constant/hive_constant.dart';
import '../../../product/enum/language_extension.dart';
import '../../../product/service/cacheService/visual_cache_service.dart';
part 'home_state.dart';

final homeRiverpod =
    NotifierProvider<HomeRiverpod, HomeState>(() => HomeRiverpod());

class HomeRiverpod extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState();
  }

  BaseCacheService<VisualCacheModel>? cacheService;

  Future<void> init() async {
    cacheService ??=
        VisualCacheService(boxName: HiveConstants.visualCacheModelBoxName);
    await cacheService!.init();
    await getSavedVisuals();
  }

  Future<void> getSavedVisuals() async {
    state = state.copyWith(loadingStatus: LoadingStatus.loading);
    try {
      state = state.copyWith(loadingStatus: LoadingStatus.loading);
      List<VisualCacheModel>? visuals = await cacheService?.getItems();
      if (visuals != null) {
        state = state.copyWith(
            visuals: visuals, loadingStatus: LoadingStatus.success);
      } else {
        state = state.copyWith(loadingStatus: LoadingStatus.error);
      }
    } catch (e) {
      log("Error: $e");
      state = state.copyWith(loadingStatus: LoadingStatus.error);
    }
  }

  Future<void> deleteVisual(String id) async {
    await cacheService?.removeItem(id).then((_) async {
      await getSavedVisuals();
    });
    log(state.visuals.length.toString());
  }

  void onChangeLanguageByCode(BuildContext context, String code) {
    final targetLocale = code == LanguageManager.instance.trLocale.languageCode
        ? LanguageManager.instance.trLocale
        : LanguageManager.instance.enLocale;

    context.setLocale(targetLocale);
    state = state.copyWith(
      currentLocale: targetLocale,
      selectedLanguage: code == LanguageManager.instance.trLocale.languageCode
          ? LocaleKeys.HomeView_trLang.tr()
          : LocaleKeys.HomeView_enLang.tr(),
    );
  }
}
