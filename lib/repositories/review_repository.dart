import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mocks/mock_reviews.dart';
import '../mocks/mock_shops.dart';
import '../models/review.dart';
import '../utils/extensions.dart';

export '../models/review.dart';

final reviewRepositoryProvider = Provider((ref) => ReviewRepository());

class ReviewRepository {
  Future<Reviews> getReviews([String? shopId]) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (shopId == null) {
      return mockReviews.map(
        (review) {
          final randomIndex = Random().nextInt(mockShops.length);
          final shopName = mockShops.elementAt(randomIndex).name;

          return review.copyWith(shopName: shopName);
        },
      ).toList();
    }

    final shopName = mockShops.firstWhere((shop) => shop.id == shopId).name;
    return mockReviews
        .getRandomSubset()
        .map(
          (review) => review.copyWith(shopName: shopName),
        )
        .toList();
  }
}
