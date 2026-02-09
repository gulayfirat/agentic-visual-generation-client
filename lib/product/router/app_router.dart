import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../feature/generateVisual/view/generate_visual_view.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/splash/view/splash_view.dart';
import '../../feature/visuals/view/visuals_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: VisualsRoute.page),
        AutoRoute(page: GenerateVisualRoute.page),
      ];
}
