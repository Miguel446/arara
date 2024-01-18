import 'user.dart';

typedef Reviews = List<Review>;

class Review {
  final String id;
  final User user;
  final int stars;
  final String text;
  final DateTime createdAt;
  final List<String>? imageUrls;

  const Review({
    required this.id,
    required this.user,
    required this.stars,
    required this.text,
    required this.createdAt,
    this.imageUrls,
  });
}
