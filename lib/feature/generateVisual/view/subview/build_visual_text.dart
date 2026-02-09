part of '../generate_visual_view.dart';

Center buildVisualText(BuildContext context, GenerateVisualRiverpod read,
    GenerateVisualState watch) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.GenerateVisualView_VisualText_title.tr(),
                    style: AppTextStyle.blackBold14),
                Text(LocaleKeys.GenerateVisualView_VisualText_subTitle.tr(),
                    style: AppTextStyle.blackRegular12)
              ],
            ),
            CustomSwitch(
              value: watch.isAddText,
              onChanged: read.changeShowTextOnImage,
            ),
          ],
        ).pOnly(top: context.width * 0.05),
        Visibility(
          visible: watch.isAddText,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  maxLength: 300,
                  hintText: LocaleKeys.GenerateVisualView_VisualText_title.tr(),
                  controller: read.imageTextController,
                  onChanged: null),
              Text(
                      LocaleKeys.GenerateVisualView_VisualText_TextStyle_title
                          .tr(),
                      style: AppTextStyle.blackBold18)
                  .pSymetric(vertical: context.width * 0.05),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: PostTextStyleType.values.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  final textStyleType = PostTextStyleType.values[index];
                  final isSelected = watch.selectedStyle == textStyleType;
                  return GestureDetector(
                    onTap: () => read.selectPostTextStyleType(textStyleType),
                    child: AnimatedContainer(
                      duration: context.lowDuration,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.voluptuousViolet.withOpacity(0.1)
                            : AppColor.white,
                        borderRadius: context.border20Radius,
                        border: Border.all(
                            color: isSelected
                                ? AppColor.midnightMonarch
                                : AppColor.blueberryWhip,
                            width: 2),
                      ),
                      child: Center(
                        child: Text(
                          textStyleType.name,
                          textAlign: TextAlign.center,
                          style: textStyleType.getStyle(isSelected),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ),
  );
}
