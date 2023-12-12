import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/review_repository.dart';

export '../models/review.dart';

final reviewsProvider = FutureProvider.autoDispose<List<Review>>((ref) {
  return ref.watch(reviewRepositoryProvider).getAllReviews();
});
