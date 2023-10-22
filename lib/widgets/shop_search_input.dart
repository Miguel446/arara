import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/providers/shop_search_name_provider.dart';
import 'scaled_icon.dart';

class ShopSearchInput extends ConsumerWidget {
  const ShopSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: const InputDecoration(
        suffixIcon: ScaledIcon(Icons.search),
        hintText: 'Procure por bazares e brechós',
      ),
      onChanged: (value) =>
          ref.read(shopSearchNameProvider.notifier).state = value,
    );
  }
}
