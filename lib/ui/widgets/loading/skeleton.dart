import 'package:arara/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
        baseColor: Palette.paletaRoxa[500]!,
        highlightColor: Palette.paletaRoxa[300]!,
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
