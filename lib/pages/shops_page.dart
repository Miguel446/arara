import 'package:flutter/material.dart';

import '../shared/models/shop.dart';
import '../ui/widgets/home_header.dart';
import '../ui/widgets/tabs/shop_card_tab.dart';

class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (_, __) => const [HomeHeader()],
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            ShopCardTab(ShopType.physical),
            ShopCardTab(ShopType.virtual),
          ],
        ),
      ),
    );
  }
}
