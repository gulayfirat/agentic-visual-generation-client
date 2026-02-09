import 'package:flutter/material.dart';

import '../../core/assets/assets.dart';
import '../../core/extension/string/string_extension.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.lottie.lotError.toLottie(),
        Text("Error", textAlign: TextAlign.center),
      ],
    );
  }
}
