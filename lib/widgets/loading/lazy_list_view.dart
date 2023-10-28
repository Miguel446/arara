import 'package:flutter/material.dart';

import '../../config/theme.dart';

class LazyListView<T> extends StatelessWidget {
  final bool isLoading;
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final Widget skeleton;
  final int skeletonQuantity;
  final EdgeInsets padding;

  /// A widget that creates a scrollable list of skeletons while [isLoading] is true
  /// and smoothly transitions to displaying the actual list of items.
  ///
  /// The [isLoading] parameter determines whether to display a loading skeleton
  /// list or the actual list of items created using the [itemBuilder].
  const LazyListView({
    super.key,
    required this.isLoading,
    required this.items,
    required this.itemBuilder,
    required this.skeleton,
    this.skeletonQuantity = 3,
    this.padding = AppTheme.pagePadding,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? ListView(
              key: UniqueKey(),
              padding: padding,
              children: List.filled(skeletonQuantity, skeleton),
            )
          : ListView.builder(
              key: UniqueKey(),
              padding: padding,
              itemCount: items.length,
              itemBuilder: (_, index) => itemBuilder(items[index]),
            ),
    );
  }
}
