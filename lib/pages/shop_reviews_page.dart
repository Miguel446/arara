import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import '../models/shop.dart';
import '../providers/shop_provider.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';

class ShopReviewsPage extends ConsumerWidget {
  const ShopReviewsPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id/avaliacoes';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncShop = ref.watch(shopProvider(shopId));

    return asyncShop.when(
      data: (shop) => ShopReviewsPageBody(shop),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const ErrorMessage(),
    );
  }
}

class ShopReviewsPageBody extends StatelessWidget {
  const ShopReviewsPageBody(this.shop, {super.key});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          shop.name,
        ),
      ),
      body: ListView.builder(
        padding: AppTheme.pagePadding.copyWith(top: 20),
        itemCount: shop.reviews?.length ?? 0,
        itemBuilder: (_, index) => Column(
          children: [
            ReviewCard(shop.reviews![index]),
            if (index != shop.reviews!.length - 1) const Divider(),
          ],
        ),
      ),
    );
  }
}
