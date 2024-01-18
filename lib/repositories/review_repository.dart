import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_reviews.dart';
import '../mocks/mock_shops.dart';
import '../models/review.dart';

export '../models/review.dart';

final reviewRepositoryProvider = Provider((ref) => ReviewRepository());

class ReviewRepository {
  Future<List<Review>> getReviews([String? shopId]) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (shopId == null) {
      return mockReviews;
    }
    return [...mockPhysicalShops, ...mockVirtualShops]
            .firstWhere((shop) => shop.id == shopId)
            .reviews ??
        [];
  }
}
