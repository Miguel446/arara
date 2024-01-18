import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_reviews.dart';
import '../models/review.dart';
import '../utils/extensions.dart';

export '../models/review.dart';

final reviewRepositoryProvider = Provider((ref) => ReviewRepository());

class ReviewRepository {
  Future<Reviews> getReviews([String? shopId]) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (shopId == null) {
      return mockReviews;
    }
    return mockReviews.getRandomSubset();
  }
}
