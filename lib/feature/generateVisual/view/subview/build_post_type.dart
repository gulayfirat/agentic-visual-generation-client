part of '../generate_visual_view.dart';

Center buildPostType(BuildContext context, GenerateVisualRiverpod read,
    GenerateVisualState watch) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.GenerateVisualView_PostType_title.tr(),
                style: AppTextStyle.blackBold18)
            .pSymetric(vertical: context.width * 0.05),
        ListView.builder(
            itemCount: PostType.values.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final postType = PostType.values[index];
              final isSelected = watch.selectedPostType == postType;
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: watch.selectedPostType == index
                          ? AppColor.midnightMonarch
                          : AppColor.blueberryWhip,
                    ),
                    borderRadius: context.border10Radius),
                child: ListTile(
                  onTap: () => read.changedPostType(postType),
                  tileColor: isSelected
                      ? AppColor.voluptuousViolet.withOpacity(0.1)
                      : AppColor.white,
                  contentPadding: EdgeInsets.zero,
                  title: Text(postType.label),
                  leading: Radio<PostType>(
                    fillColor: MaterialStateProperty.all(isSelected
                        ? AppColor.midnightMonarch
                        : AppColor.blueberryWhip),
                    value: postType,
                    groupValue: watch.selectedPostType,
                    onChanged: (_) {},
                  ),
                ),
              ).pOnly(bottom: context.normalVal);
            }),
      ],
    ),
  );
}
