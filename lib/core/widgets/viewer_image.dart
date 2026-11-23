// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test/core/constants/colors.dart';

/// Every remote image in the app goes through here, so the brand mark below is
/// what a customer sees while a picture loads, when it fails, and when there is
/// no picture at all.
class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({
    super.key,
    required this.image,
    this.radius = 0,
    this.isClickable = false,
    this.fit = BoxFit.cover,
  });
  final String image;
  final double radius;
  final bool isClickable;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    const placeholder = BrandImagePlaceholder();

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      // An empty url would only travel to the network stack to come back as an
      // error, so it goes straight to the brand mark.
      child: image.trim().isEmpty
          ? placeholder
          : CachedNetworkImage(
              imageUrl: image,
              fit: fit,
              width: double.infinity,
              height: double.infinity,
              fadeInDuration: const Duration(milliseconds: 250),
              errorWidget: (context, url, _) => placeholder,
              placeholder: (context, url) => placeholder,
            ),
    );
  }
}

class BrandImagePlaceholder extends StatelessWidget {
  const BrandImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sides = <double>[
          if (constraints.hasBoundedWidth) constraints.maxWidth,
          if (constraints.hasBoundedHeight) constraints.maxHeight,
        ];
        final box = sides.isEmpty ? 96.0 : sides.reduce(math.min);
        // The mark is a wide lockup, so a small box (a chip, a list avatar)
        // gets a bigger share of itself than a product image does.
        final share = box < 64 ? 0.86 : 0.55;

        return Container(
          color: AppColors.lightBlue2,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo.png',
            width: (box * share).clamp(24.0, 150.0),
            fit: BoxFit.contain,
            color: AppColors.mainColor.withValues(alpha: 0.55),
            colorBlendMode: BlendMode.srcIn,
          ),
        );
      },
    );
  }
}
