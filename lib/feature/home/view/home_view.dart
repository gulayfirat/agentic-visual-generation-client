import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgen_app/core/assets/assets.dart';
import 'package:postgen_app/core/constants/app_color.dart';
import 'package:postgen_app/core/constants/app_text_styles.dart';
import 'package:postgen_app/core/extension/context/context_extension.dart';
import 'package:postgen_app/core/extension/string/string_extension.dart';
import 'package:postgen_app/core/extension/widget/widget_extension.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';
import 'package:postgen_app/core/manager/language_manager.dart';
import '../../../product/router/app_router.dart';
import '../../../product/widgets/custom_elevated_button.dart';
import '../viewModel/home_riverpod.dart';
part 'subView/build_visuals.dart';
part 'subView/build_empty_visuals.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(homeRiverpod.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(homeRiverpod);
    final read = ref.read(homeRiverpod.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("PostGen", style: AppTextStyle.blackBold18),
                buildChangeLanguageDropDown(read, watch)
              ],
            ).pConstBottom(context),
            watch.visuals.isNotEmpty
                ? Expanded(
                    child: Column(
                      children: [
                        Expanded(child: buildVisuals(context, watch, read)),
                        CustomElevatedButton(
                            buttonText: LocaleKeys.HomeView_newVisual.tr(),
                            onTap: () =>
                                context.router.push(GenerateVisualRoute()))
                      ],
                    ),
                  )
                : buildEmptyVisual(context),
          ],
        ).pSymetric(horizontal: context.pageHorizontal),
      ),
    );
  }

  Widget buildChangeLanguageDropDown(HomeRiverpod read, HomeState watch) {
    final String currentLangCode =
        watch.currentLocale?.languageCode ?? context.locale.languageCode;

    return Container(
      height: context.width * 0.08,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.midnightMonarch),
        borderRadius: context.border12Radius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentLangCode,
          icon: const Icon(Icons.keyboard_arrow_down, size: 18),
          style: AppTextStyle.blackRegular12,
          items: [
            DropdownMenuItem(
              value: LanguageManager.instance.trLocale.languageCode,
              child: Text(LocaleKeys.HomeView_trLang.tr()),
            ),
            DropdownMenuItem(
              value: LanguageManager.instance.enLocale.languageCode,
              child: Text(LocaleKeys.HomeView_enLang.tr()),
            ),
          ],
          onChanged: (String? code) {
            if (code != null) {
              read.onChangeLanguageByCode(context, code);
            }
          },
        ),
      ).pSymetric(horizontal: context.normalVal),
    );
  }
}
