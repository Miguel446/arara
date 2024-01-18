import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/review_repository.dart';

export '../models/review.dart';

final reviewsProvider =
    FutureProvider.autoDispose.family<Reviews, String?>((ref, shopId) {
  return ref.watch(reviewRepositoryProvider).getReviews(shopId);
});
