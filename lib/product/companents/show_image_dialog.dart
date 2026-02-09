// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/init/lang/locale_keys.g.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/extension/context/context_extension.dart';
import '../../core/extension/string/string_extension.dart';
import '../../core/extension/widget/widget_extension.dart';
import '../utilty/custom_cached_network_image.dart';

Future<dynamic> showImageDialog({
  required BuildContext context,
  required String imageUrl,
  required void Function()? onPressed,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: BuildImage(imageUrl: imageUrl, onPressed: onPressed),
        );
      });
}

class BuildImage extends StatelessWidget {
  const BuildImage(
      {super.key, required this.imageUrl, required this.onPressed});

  final String imageUrl;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return buildImage(context);
  }

  Material buildImage(BuildContext context) {
    return Material(
      color: AppColor.black.withOpacity(0.5),
      child: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              InteractiveViewer(
                child: ClipRRect(
                    borderRadius: context.border12Radius,
                    child: CustomCachedNetworkImage(
                      imageUrl: imageUrl,
                      width: context.width,
                      radius: context.border12Radius,
                      fit: BoxFit.fill,
                    )),
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    imageActionButton(
                        context: context,
                        icon: Assets.icons.icCloseSvg,
                        label: LocaleKeys.GlobalTexts_close.tr(),
                        onPressed: () => context.router.maybePop()),
                    SizedBox(width: context.width * 0.1),
                    imageActionButton(
                        context: context,
                        icon: Assets.icons.icDownloadSvg,
                        label: LocaleKeys.GlobalTexts_download.tr(),
                        onPressed: onPressed),
                  ],
                ).pSymetric(horizontal: context.width * 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded imageActionButton(
      {required BuildContext context,
      required String icon,
      String? label,
      required void Function()? onPressed}) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: icon
            .toColorSvg(color: AppColor.midnightMonarch)
            .sized(width: context.width * 0.05, height: context.width * 0.05),
        label: Text(
          label ?? "",
          style: AppTextStyle.midnightMonarchRegular14,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
