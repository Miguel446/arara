import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../shared/extensions.dart';
import '../../shared/models/review.dart';
import '../image_carousel.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(this.review, {super.key}) : hasBorder = false;

  const ReviewCard.border(this.review, {super.key}) : hasBorder = true;

  final Review review;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: hasBorder
          ? const EdgeInsets.symmetric(horizontal: 28, vertical: 24)
          : const EdgeInsets.symmetric(vertical: 12),
      decoration: hasBorder
          ? ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[500]!),
                borderRadius: BorderRadius.circular(24),
              ),
            )
          : null,
      child: Column(
        children: [
          if (!hasBorder && review.imageUrls?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ImageCarousel(review.imageUrls!),
            ),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: review.user.photoUrl != null
                    ? NetworkImage(review.user.photoUrl!)
                    : null,
                child: review.user.photoUrl != null
                    ? null
                    : const Icon(Icons.person),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.user.name,
                      style: textTheme.labelSmall,
                    ),
                    Row(
                      children: List.filled(
                        review.stars,
                        const Icon(Icons.star, size: 14),
                      ),
                    ),
                    Text(
                      review.createdAt.toSomeTimeAgo(),
                      style: textTheme.bodySmall
                          ?.copyWith(color: AppTheme.black400),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            review.text,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
