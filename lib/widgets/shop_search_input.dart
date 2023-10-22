import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/shop_search_name_provider.dart';

class ShopSearchInput extends ConsumerWidget {
  const ShopSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.search),
        hintText: 'Procure por bazares e brechós',
      ),
      onChanged: (value) =>
          ref.read(shopSearchNameProvider.notifier).state = value,
    );
  }
}
