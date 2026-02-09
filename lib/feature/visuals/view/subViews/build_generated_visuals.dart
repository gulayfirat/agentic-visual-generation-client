part of '../visuals_view.dart';

Expanded buildGeneratedVisuals(
    BuildContext context, List<Uint8List> imageBytes) {
  return Expanded(
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: context.heighVal),
      itemCount: imageBytes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: context.width * 0.6,
        mainAxisSpacing: context.width * 0.1,
        crossAxisSpacing: context.heighVal,
      ),
      itemBuilder: (context, index) {
        final imageByte = imageBytes[index];
        return ClipRRect(
          borderRadius: context.border12Radius,
          child: Image.memory(
            height: context.width,
            width: context.width,
            imageByte,
            fit: BoxFit.cover,
          ).gestureDetector(onTap: () {
            _showDetailDialog(context, imageByte);
          }),
        );
      },
    ),
  );
}

void _showDetailDialog(BuildContext context, Uint8List imageByte) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: context.border12Radius,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          InteractiveViewer(
            child: ClipRRect(
              borderRadius: context.border12Radius,
              child: Image.memory(
                height: context.width,
                width: context.width,
                imageByte,
                fit: BoxFit.cover,
              ).pOnly(
                bottom: context.width * 0.12,
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final status = ref.watch(visualsRiverpod).loadingStatus;
            return status == LoadingStatus.loading
                ? CircularProgressIndicator()
                : CustomElevatedButton(
                    buttonText: LocaleKeys
                        .VisualView_SaveToGalleryDialog_saveButtonText.tr(),
                    onTap: () async {
                      await ref
                          .read(visualsRiverpod.notifier)
                          .saveToGallery(imageBytes: imageByte);
                      Future.delayed(context.normalDuration, () {
                        customScaffoldMessenger(
                            context: context,
                            message: status == LoadingStatus.success
                                ? LocaleKeys
                                        .VisualView_SaveToGalleryDialog_successMessage
                                    .tr()
                                : LocaleKeys
                                        .VisualView_SaveToGalleryDialog_unSuccessMessage
                                    .tr());
                      }).then((value) => context.router.maybePop());
                    },
                  );
          }),
        ],
      ).sized(height: context.width),
    ),
  );
}
