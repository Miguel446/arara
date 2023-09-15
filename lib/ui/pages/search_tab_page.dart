import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../shared/models/shop.dart';
import '../../shared/repositories/shop_repository.dart';
import '../widgets/shop_card.dart';

class SearchTabPage extends StatefulWidget {
  final ShopType shopType;

  const SearchTabPage(this.shopType, {super.key});

  @override
  State<SearchTabPage> createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage> {
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
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 50),
      children: shops
          .map(
            (shop) => ShopCard(shop),
          )
          .toList(),
    );
  }
}
