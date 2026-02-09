part of '../home_view.dart';

Padding buildVisuals(BuildContext context, HomeState watch, HomeRiverpod read) {
  return GridView.builder(
    padding: context.dynamicOnlyPadding(
        top: context.width * 0.05, bottom: context.width * 0.05),
    shrinkWrap: true,
    itemCount: watch.visuals.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisExtent: context.width * 0.5,
      mainAxisSpacing: context.heighVal,
      crossAxisSpacing: context.heighVal,
    ),
    itemBuilder: (context, index) {
      return Stack(
        clipBehavior: Clip.none,
        children: List.generate(watch.visuals[index].imageBytes!.length, (i) {
          final reverseIndex = watch.visuals[index].imageBytes!.length - 1 - i;

          return _imageItem(
            context: context,
            offset: Offset(
              4.0 * reverseIndex,
              -4.0 * reverseIndex,
            ),
            rotation: -0.02 * reverseIndex,
            imageBytes: watch.visuals[index].imageBytes?[i],
          ).pAll(context.normalVal);
        }),
      ).gestureDetector(
        onTap: () {
          if (watch.visuals[index].imageBytes != null) {
            List<Uint8List> imageBytes = watch.visuals[index].imageBytes!
                .whereType<Uint8List>()
                .toList();
            context.router
                .push(VisualsRoute(isDetail: true, imageBytes: imageBytes));
          }
        },
        onLongTap: () =>
            showDeleteImageDialog(context, read, watch.visuals[index].id),
      );
    },
  ).pOnly();
}

Widget _imageItem({
  required BuildContext context,
  required Offset offset,
  required double rotation,
  required Uint8List? imageBytes,
}) {
  return Transform.translate(
    offset: offset,
    child: Transform.rotate(
      angle: rotation,
      child: ClipRRect(
        borderRadius: context.border12Radius,
        child: Image.memory(
          height: context.width * 0.5,
          width: context.width * 0.5,
          imageBytes!,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Future<bool?> showDeleteImageDialog(
    BuildContext context, HomeRiverpod read, String id) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          LocaleKeys.HomeView_DeleteImageDialog_title.tr(),
          style: AppTextStyle.blackBold14,
        ),
        content: Text(
          LocaleKeys.HomeView_DeleteImageDialog_subTitle.tr(),
          style: AppTextStyle.blackRegular12,
        ),
        actions: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomElevatedButton(
                  isFilled: false,
                  onTap: () => context.router.maybePop(),
                  buttonText: LocaleKeys.HomeView_DeleteImageDialog_cancel.tr(),
                ),
              ),
              SizedBox(width: context.width * 0.04),
              Flexible(
                flex: 1,
                child: CustomElevatedButton(
                  onTap: () {
                    read.deleteVisual(id);
                    context.router.maybePop();
                  },
                  buttonText: LocaleKeys.HomeView_DeleteImageDialog_delete.tr(),
                ),
              ),
            ],
          ).sized(height: context.width * 0.1)
        ],
      );
    },
  );
}
