part of '../home_view.dart';

Expanded buildEmptyVisual(BuildContext context) {
  return Expanded(
    child: Center(
        child: DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 1,
        radius: Radius.circular(20),
        color: AppColor.voluptuousViolet,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lynxWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.lotGallery
                .toLottie(height: context.width * 0.4, width: context.width),
            Text(
              LocaleKeys.HomeView_emptyVisualTitle.tr(),
              style: AppTextStyle.blackBold14,
              textAlign: TextAlign.center,
            ).pOnly(bottom: context.width * 0.1),
            CustomElevatedButton(
                buttonText: LocaleKeys.HomeView_generateVisual.tr(),
                onTap: () => context.router.push(GenerateVisualRoute())),
          ],
        ).pAll(context.pageHorizontal),
      ),
    ).sized(width: context.width * 0.8, height: context.width * 1.4)),
  );
}
