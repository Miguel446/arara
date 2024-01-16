import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../mixins/debounced_shop_search_mixin.dart';
import '../../providers/shop_search_name_provider.dart';
import '../../repositories/shop_repository.dart';
import '../loading/lazy_list_view.dart';
import '../loading/shop_card_skeleton.dart';
import '../shop_card.dart';

class ShopCardTab extends ConsumerStatefulWidget {
  final ShopType shopType;

  const ShopCardTab(this.shopType, {super.key});

  @override
  ConsumerState<ShopCardTab> createState() => _ShopCardTabState();
}

class _ShopCardTabState extends ConsumerState<ShopCardTab>
    with DebouncedShopSearchMixin {
  @override
  String? get shopName => ref.read(shopSearchNameProvider);

  @override
  ShopType get shopType => widget.shopType;

  @override
  Widget build(BuildContext context) {
    ref.listen(shopSearchNameProvider, (_, __) => debouncedGetShops.run());

    return LazyListView(
      isLoading: isLoading,
      skeleton: const ShopCardSkeleton(),
      items: shops,
      itemBuilder: (shop) => ShopCard(shop),
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
    );
  }
}
