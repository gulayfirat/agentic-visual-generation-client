part of '../generate_visual_view.dart';

Center buildColorPreference(BuildContext context, GenerateVisualRiverpod read,
    GenerateVisualState watch) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.GenerateVisualView_ColorTone_title.tr(),
                style: AppTextStyle.blackBold18)
            .pSymetric(vertical: context.width * 0.05),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ColorToneType.values.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final colorType = ColorToneType.values[index];
            final isSelected =
                watch.selectedColor == ColorToneType.values[index];

            return GestureDetector(
              onTap: () => read.selectColor(ColorToneType.values[index]),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: context.width * 0.24,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: colorType.gradient,
                          ),
                          borderRadius: context.border20Radius,
                          border: Border.all(
                            color: isSelected
                                ? colorType.borderColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      if (isSelected)
                        Positioned(
                          top: context.normalVal,
                          right: context.normalVal,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.white,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.check,
                              size: 16,
                              color: colorType.borderColor,
                            ),
                          ),
                        ),
                    ],
                  ).pOnly(bottom: context.normalVal),
                  Text(colorType.title, style: AppTextStyle.blackRegular12),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}
