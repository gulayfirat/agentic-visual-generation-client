part of '../generate_visual_view.dart';

Column buildVisualMood(BuildContext context, GenerateVisualRiverpod read,
    GenerateVisualState watch) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(LocaleKeys.GenerateVisualView_VisualMood_title.tr(),
              style: AppTextStyle.blackBold18)
          .pSymetric(vertical: context.width * 0.05),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(VisualMood.values.length, (index) {
          final mood = VisualMood.values[index];
          final isSelected = watch.selectedMood == mood;
          return GestureDetector(
            onTap: () => read.changeVisualMood(mood),
            child: AnimatedContainer(
              duration: context.lowDuration,
              padding: context.dynamicSymmetricPadding(
                  context.heighVal * 2, context.heighVal),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.midnightMonarch : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isSelected
                      ? AppColor.midnightMonarch
                      : AppColor.blueberryWhip,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(mood.icon,
                      size: 18,
                      color: isSelected ? AppColor.white : AppColor.naturalism),
                  const SizedBox(width: 8),
                  Text(
                    mood.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColor.white : AppColor.throat,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ],
  );
}
