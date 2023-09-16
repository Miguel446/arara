class Shop {
  final String id;
  final String name;
  final ShopType type;
  final String? instagram;
  final String? address;
  final String? phone;
  final String openingHours;
  final List<String>? imageUrls;
  final double? averageRating;
  final int? numberOfRatings;
  // final List<Perk> perks;
  // final List<Review> reviews;

  const Shop({
    required this.id,
    required this.name,
    required this.type,
    this.instagram,
    this.address,
    this.phone,
    required this.openingHours,
    this.imageUrls,
    this.averageRating,
    this.numberOfRatings,
  });
}

enum ShopType { physical, virtual }
