import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/theme.dart';

class Skeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxShape shape;
  final BorderRadius borderRadius;

  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  }) : shape = BoxShape.rectangle;

  const Skeleton.circle({
    super.key,
    double? size,
  })  : width = size,
        height = size,
        shape = BoxShape.circle,
        borderRadius = BorderRadius.zero;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Shimmer.fromColors(
        baseColor: AppTheme.primary[500]!,
        highlightColor: AppTheme.primary[300]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: shape,
          ),
        ),
      ),
    );
  }
}
