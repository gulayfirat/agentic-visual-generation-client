import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgen_app/core/constants/app_text_styles.dart';
import 'package:postgen_app/core/extension/widget/widget_extension.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';
import 'package:postgen_app/feature/generateVisual/viewModel/generate_visual_riverpod.dart';
import 'package:postgen_app/product/router/app_router.dart';
import 'package:postgen_app/product/widgets/custom_textfield.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/enums/loading_status.dart';
import '../../../core/extension/context/context_extension.dart';
import '../../../product/companents/custom_scaffold_messenger.dart';
import '../../../product/config/color_preferences.dart';
import '../../../product/config/post_text_style_types.dart';
import '../../../product/config/post_types.dart';
import '../../../product/config/visial_moods.dart';
import '../../../product/widgets/custom_appbar.dart';
import '../../../product/widgets/custom_elevated_button.dart';
import '../../../product/widgets/custom_rounded_linear_progress.dart';
import '../../../product/widgets/custom_switch.dart';
part 'subview/build_change_pageview_buttons.dart';
part 'subview/build_color_preference.dart';
part 'subview/build_post_type.dart';
part 'subview/build_visual_text.dart';
part 'subview/build_visual_mood.dart';
part 'subview/build_visual_description.dart';

@RoutePage()
class GenerateVisualView extends ConsumerStatefulWidget {
  final bool isNewGeneration;
  const GenerateVisualView({super.key, this.isNewGeneration = true});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenerateVisualState();
}

class _GenerateVisualState extends ConsumerState<GenerateVisualView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      ref.read(generateVisialRiverpod.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(generateVisialRiverpod);
    final read = ref.read(generateVisialRiverpod.notifier);
    return Scaffold(
      appBar: CustomAppBar(
          title: LocaleKeys.GenerateVisualView_appBarTitle.tr(),
          backRoute: () => context.router.back()),
      body: AbsorbPointer(
        absorbing: watch.loadingStatus == LoadingStatus.loading,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              RoundedLinearProgress(value: (watch.currentPageIndex + 1) / 5),
              PageView(
                controller: read.pageViewController,
                onPageChanged: (value) => read.onPageChanged(value),
                children: <Widget>[
                  buildVisualDescription(context, read),
                  buildPostType(context, read, watch),
                  buildVisualMood(context, read, watch),
                  buildColorPreference(context, read, watch),
                  buildVisualText(context, read, watch),
                ],
              ),
              buildChangePageViewButtons(
                  read, watch, context, watch.currentPageIndex == 4, ref),
              watch.loadingStatus == LoadingStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColor.midnightMonarch,
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ).pAll(context.pageHorizontal),
        ),
      ),
    );
  }
}
