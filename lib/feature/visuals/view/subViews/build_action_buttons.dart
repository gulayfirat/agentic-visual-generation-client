part of '../visuals_view.dart';

Padding buildActionButtons(BuildContext context) {
  return CustomElevatedButton(
          buttonText: LocaleKeys.VisualView_changeStyleButtonText.tr(),
          onTap: () =>
              context.router.push(GenerateVisualRoute(isNewGeneration: false)))
      .pAll(context.pageHorizontal);
}
