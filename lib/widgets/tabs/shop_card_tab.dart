import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/shop_search_name_provider.dart';
import '../../repositories/shop_repository.dart';
import '../../utils/debouncer.dart';
import '../loading/lazy_list_view.dart';
import '../loading/shop_card_skeleton.dart';
import '../shop_card.dart';

class ShopCardTab extends ConsumerStatefulWidget {
  final ShopType shopType;

  const ShopCardTab(this.shopType, {super.key});

  @override
  ConsumerState<ShopCardTab> createState() => _ShopCardTabState();
}

class _ShopCardTabState extends ConsumerState<ShopCardTab> {
  List<Shop> shops = [];
  bool isLoading = false;

  late final debouncedGetShops = Debouncer(milliseconds: 500, action: getShops);

  Future<void> getShops() async {
    setState(() => isLoading = true);

    final searchName = ref.read(shopSearchNameProvider);

    try {
      shops = await ref.read(shopRepositoryProvider).getShops(
            type: widget.shopType,
            name: searchName,
          );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    getShops();
  }

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
