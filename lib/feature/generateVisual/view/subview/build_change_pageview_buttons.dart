part of '../generate_visual_view.dart';

Positioned buildChangePageViewButtons(
    GenerateVisualRiverpod read,
    GenerateVisualState watch,
    BuildContext context,
    bool? isLastPage,
    WidgetRef ref) {
  return Positioned(
    bottom: 0,
    child: isLastPage == false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              watch.currentPageIndex != 0
                  ? Expanded(
                      child: CustomElevatedButton(
                          buttonText: LocaleKeys
                              .GenerateVisualView_previousButtonText.tr(),
                          isFilled: false,
                          onTap: () => read.onPreviousPage()),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                  width: watch.currentPageIndex != 0
                      ? context.width * 0.2
                      : context.kZero),
              Expanded(
                child: CustomElevatedButton(
                  buttonText: LocaleKeys.GenerateVisualView_nextButtonText.tr(),
                  onTap: () => read.onNextPage(),
                ),
              ),
            ],
          )
            .sized(width: context.width - context.pageHorizontal * 2)
            .pAll(context.pageHorizontal)
        : Column(
            children: [
              Consumer(
                builder: (context, ref, _) => CustomElevatedButton(
                  onTap: () async {
                    final bytes = await read.generateAndSaveVisuals();
                    if (context.mounted) {
                      if (bytes != null && bytes.isNotEmpty) {
                        context.router.push(
                          VisualsRoute(imageBytes: bytes, isDetail: false),
                        );
                      } else {
                        customScaffoldMessenger(
                            context: context,
                            message: LocaleKeys.GenerateVisualView_errorMessage
                                .tr());
                      }
                    }
                  },
                  buttonText: LocaleKeys.GenerateVisualView_generateVisual.tr(),
                ),
              ),
              SizedBox(height: context.width * 0.02),
              CustomElevatedButton(
                  buttonText:
                      LocaleKeys.GenerateVisualView_previousButtonText.tr(),
                  isFilled: false,
                  onTap: () => read.onPreviousPage()),
            ],
          )
            .sized(width: context.width - context.pageHorizontal * 2)
            .pAll(context.pageHorizontal),
  );
}
