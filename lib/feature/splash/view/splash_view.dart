import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgen_app/core/assets/assets.dart';
import 'package:postgen_app/core/constants/app_color.dart';
import 'package:postgen_app/core/extension/context/context_extension.dart';
import 'package:postgen_app/core/extension/string/string_extension.dart';
import 'package:postgen_app/product/constant/app_contanst.dart';
import 'package:postgen_app/product/router/app_router.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(context.normalDuration,
          () => AppConstant.appRouter.replace(HomeRoute()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.midnightMonarch,
      body: Center(child: Assets.lottie.lotSplash.toLottie()),
    );
  }
}
