import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/models/shop.dart';
import '../../shared/repositories/shop_repository.dart';
import '../widgets/loading/shop_card_skeleton.dart';
import '../widgets/shop_card.dart';

class ShopCardTab extends StatefulWidget {
  final ShopType shopType;

  const ShopCardTab(this.shopType, {super.key});

  @override
  State<ShopCardTab> createState() => _ShopCardTabState();
}

class _ShopCardTabState extends State<ShopCardTab> {
  List<Shop> shops = [];
  bool isLoading = false;

  Future<void> getShops() async {
    setState(() => isLoading = true);

    try {
      shops = await GetIt.I<ShopRepository>().getShops(type: widget.shopType);
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
