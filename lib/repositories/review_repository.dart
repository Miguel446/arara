import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_reviews.dart';
import '../models/review.dart';

export '../models/review.dart';

final reviewRepositoryProvider = Provider((ref) => ReviewRepository());

class ReviewRepository {
  Future<List<Review>> getAllReviews() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return mockReviews;
  }
}
