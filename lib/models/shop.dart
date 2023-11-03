import 'package:flutter/material.dart';

import 'review.dart';

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
  final List<ShopPerk>? perks;
  final List<Review>? reviews;

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
    this.perks,
    this.reviews,
  });
}

enum ShopType { physical, virtual }

enum ShopPerk {
  airConditioning(
    Icons.air_rounded,
    'Ambiente climatizado',
    'Espaço inteiramente com ar condicionado para deixar você mais confortável.',
  ),
  location(
    Icons.location_on_rounded,
    'Espaço bem localizado',
    'Espaço com localização privilegiada, perto de shopping e avenidas movimentadas.',
  ),
  newClothes(
    Icons.checkroom_rounded,
    'Roupas na etiqueta',
    'Diversos tipos de peças de roupas que ainda estão na etiqueta.',
  );

  const ShopPerk(this.icon, this.title, this.description);

  final IconData icon;
  final String title;
  final String description;
}
