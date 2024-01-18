import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import '../models/shop.dart';
import '../providers/reviews_provider.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';
import '../widgets/logo_app_bar.dart';
import '../widgets/shop_search_dropdown.dart';

class ReviewsPage extends ConsumerStatefulWidget {
  const ReviewsPage({super.key});

  @override
  ConsumerState<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends ConsumerState<ReviewsPage> {
  Shop? selectedShop;

  @override
  Widget build(BuildContext context) {
    final reviews = ref.watch(reviewsProvider(selectedShop?.id));

    return Scaffold(
      appBar: const LogoAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avaliações',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                ShopSearchDropdown(
                  onSelected: (value) => setState(() => selectedShop = value),
                ),
              ],
            ),
          ),
          Expanded(
            child: reviews.when(
              data: (reviews) => ReviewsPageBody(
                reviews,
                shop: selectedShop,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => const ErrorMessage(),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewsPageBody extends StatelessWidget {
  const ReviewsPageBody(this.reviews, {this.shop, super.key});

  final Reviews reviews;
  final Shop? shop;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return ErrorMessage(
        message: shop?.name != null
            ? '${shop!.name} ainda não possui avaliações'
            : 'Ainda não há avaliações',
      );
    }
    return ListView.builder(
      padding: AppTheme.pagePadding.copyWith(top: 20, bottom: 70),
      itemCount: reviews.length,
      itemBuilder: (_, index) => Column(
        children: [
          ReviewCard(reviews[index]),
          if (index != reviews.length - 1) const Divider(),
        ],
      ),
    );
  }
}
