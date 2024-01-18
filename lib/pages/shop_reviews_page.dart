import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import '../models/review.dart';
import '../models/shop.dart';
import '../providers/shop_with_reviews_provider.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';

class ShopReviewsPage extends ConsumerWidget {
  const ShopReviewsPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id/avaliacoes';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(shopWithReviewsProvider(shopId));

    return asyncData.when(
      data: (data) => ShopReviewsPageBody(data.shop, data.reviews),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const ErrorMessage(),
    );
  }
}

class ShopReviewsPageBody extends StatelessWidget {
  const ShopReviewsPageBody(this.shop, this.reviews, {super.key});

  final Shop shop;
  final List<Review> reviews;

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
        itemCount: reviews.length,
        itemBuilder: (_, index) => Column(
          children: [
            ReviewCard(reviews[index]),
            if (index != reviews.length - 1) const Divider(),
          ],
        ),
      ),
    );
  }
}
