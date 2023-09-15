import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../shared/models/shop.dart';
import '../../shared/providers/shop_search_name_provider.dart';
import '../../shared/repositories/shop_repository.dart';
import '../../shared/utils/debouncer.dart';
import '../widgets/loading/shop_card_skeleton.dart';
import '../widgets/shop_card.dart';

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
      shops = await GetIt.I<ShopRepository>().getShops(
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

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? ListView(
              key: UniqueKey(),
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
              children: List.filled(3, const ShopCardSkeleton()),
            )
          : ListView(
              key: UniqueKey(),
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
              children: shops
                  .map(
                    (shop) => ShopCard(shop),
                  )
                  .toList(),
            ),
    );
  }
}
