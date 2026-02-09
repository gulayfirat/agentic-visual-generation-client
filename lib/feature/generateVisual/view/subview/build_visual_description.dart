part of '../generate_visual_view.dart';

Padding buildVisualDescription(
    BuildContext context, GenerateVisualRiverpod read) {
  return CustomTextField(
          maxLength: 300,
          labelText:
              LocaleKeys.GenerateVisualView_VisualDescription_labelText.tr(),
          hintText:
              LocaleKeys.GenerateVisualView_VisualDescription_hintText.tr(),
          controller: read.imageDescriptionController,
          onChanged: null)
      .pSymetric(vertical: context.width * 0.05);
}
