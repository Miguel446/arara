import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/review_repository.dart';
import '../repositories/shop_repository.dart';

final shopWithReviewsProvider = FutureProvider.autoDispose
    .family<({Shop shop, List<Review> reviews}), String>((ref, shopId) async {
  final [shop as Shop, reviews as List<Review>] = await Future.wait(
    [
      ref.watch(shopRepositoryProvider).getShopById(shopId),
      ref.watch(reviewRepositoryProvider).getReviews(shopId),
    ],
  );

  return (shop: shop, reviews: reviews);
});
