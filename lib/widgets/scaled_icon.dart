import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/font_size_provider.dart';

class ScaledIcon extends ConsumerWidget {
  const ScaledIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
  });

  final IconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      icon,
      color: color,
      size: size * ref.watch(fontSizeFactorProvider),
    );
  }
}
