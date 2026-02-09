import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgen_app/core/constants/app_text_styles.dart';
import 'package:postgen_app/core/enums/loading_status.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';
import 'package:postgen_app/product/companents/custom_scaffold_messenger.dart';
import 'package:postgen_app/product/router/app_router.dart';
import 'package:postgen_app/product/widgets/custom_appbar.dart';
import '../../../core/extension/context/context_extension.dart';
import '../../../core/extension/widget/widget_extension.dart';
import '../../../product/widgets/custom_elevated_button.dart';
import '../viewModel/visuals_riverpod.dart';

part 'subViews/build_action_buttons.dart';
part 'subViews/build_generated_visuals.dart';

@RoutePage()
class VisualsView extends ConsumerStatefulWidget {
  final List<Uint8List> imageBytes;
  final bool isDetail;
  const VisualsView({
    super.key,
    required this.imageBytes,
    required this.isDetail,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VisualsViewState();
}

class _VisualsViewState extends ConsumerState<VisualsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: LocaleKeys.VisualView_appBarTitle.tr(),
          backRoute: () {
            context.router.pushAndPopUntil(const HomeRoute(),
                predicate: (route) => false);
          }),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.VisualView_title.tr(),
                    style: AppTextStyle.blackBold18)
                .pConstBottom(context),
            buildGeneratedVisuals(context, widget.imageBytes),
            widget.isDetail == false
                ? buildActionButtons(context)
                : SizedBox.shrink()
          ],
        ).pAll(context.pageHorizontal),
      ),
    );
  }
}
