// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [GenerateVisualView]
class GenerateVisualRoute extends PageRouteInfo<GenerateVisualRouteArgs> {
  GenerateVisualRoute({
    Key? key,
    bool isNewGeneration = true,
    List<PageRouteInfo>? children,
  }) : super(
          GenerateVisualRoute.name,
          args: GenerateVisualRouteArgs(
            key: key,
            isNewGeneration: isNewGeneration,
          ),
          initialChildren: children,
        );

  static const String name = 'GenerateVisualRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GenerateVisualRouteArgs>(
          orElse: () => const GenerateVisualRouteArgs());
      return GenerateVisualView(
        key: args.key,
        isNewGeneration: args.isNewGeneration,
      );
    },
  );
}

class GenerateVisualRouteArgs {
  const GenerateVisualRouteArgs({
    this.key,
    this.isNewGeneration = true,
  });

  final Key? key;

  final bool isNewGeneration;

  @override
  String toString() {
    return 'GenerateVisualRouteArgs{key: $key, isNewGeneration: $isNewGeneration}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [VisualsView]
class VisualsRoute extends PageRouteInfo<VisualsRouteArgs> {
  VisualsRoute({
    Key? key,
    required List<Uint8List> imageBytes,
    required bool isDetail,
    List<PageRouteInfo>? children,
  }) : super(
          VisualsRoute.name,
          args: VisualsRouteArgs(
            key: key,
            imageBytes: imageBytes,
            isDetail: isDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'VisualsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VisualsRouteArgs>();
      return VisualsView(
        key: args.key,
        imageBytes: args.imageBytes,
        isDetail: args.isDetail,
      );
    },
  );
}

class VisualsRouteArgs {
  const VisualsRouteArgs({
    this.key,
    required this.imageBytes,
    required this.isDetail,
  });

  final Key? key;

  final List<Uint8List> imageBytes;

  final bool isDetail;

  @override
  String toString() {
    return 'VisualsRouteArgs{key: $key, imageBytes: $imageBytes, isDetail: $isDetail}';
  }
}
