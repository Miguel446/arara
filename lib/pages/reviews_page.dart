import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/theme.dart';
import '../providers/reviews_provider.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';
import '../widgets/logo_app_bar.dart';

class ReviewsPage extends ConsumerWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviews = ref.watch(reviewsProvider);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avaliações',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Expanded(
            child: reviews.when(
              data: (reviews) => ReviewsPageBody(reviews),
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
  const ReviewsPageBody(this.reviews, {super.key});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
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
