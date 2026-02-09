import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/constants/app_color.dart';
import 'package:postgen_app/core/extension/context/context_extension.dart';
import 'package:postgen_app/core/extension/widget/widget_extension.dart';
import '../../core/assets/assets.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/extension/string/string_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.backRoute,
  });

  final String title;
  final Widget? leading;
  final Function()? backRoute;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: AppColor.midnightMonarch,
        title: Text(
          title,
          style: AppTextStyle.whiteBold18,
        ),
        leading: backRoute != null
            ? Assets.icons.icIosArrowLeftSVG
                .toColorSvg(color: AppColor.white)
                .pAll(context.normalVal * 2)
                .gestureDetector(
                    onTap: () => backRoute != null
                        ? backRoute!()
                        : context.router.maybePop())
            : SizedBox.shrink(),
      ),
    );
  }
}
