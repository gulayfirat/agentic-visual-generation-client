import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:postgen_app/core/constants/app_color.dart';
import 'package:postgen_app/core/extension/context/context_extension.dart';
import 'package:postgen_app/product/utilty/custom_shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? radius;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius ?? context.border12Radius,
        border: Border.all(
            color: AppColor.midnightMonarch.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius ?? context.border12Radius,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          httpHeaders: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
          },
          placeholder: (_, __) => ImageShimmer(
            width: width,
            height: height,
            radius: radius,
          ),
          errorWidget: (_, __, ___) => Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.lynxWhite,
              borderRadius: radius ?? context.border12Radius,
            ),
            child: const Icon(Icons.broken_image),
          ),
        ),
      ),
    );
  }
}
