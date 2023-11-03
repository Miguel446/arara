import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/shop.dart';
import '../pages/shop_detail_page.dart';
import '../utils/extensions.dart';
import 'image_carousel.dart';
import 'scaled_icon.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;

  const ShopCard(this.shop, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        ShopDetailPage.path.withId(shop.id),
        extra: shop,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (shop.imageUrls?.isNotEmpty == true)
              ImageCarousel(shop.imageUrls!),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      shop.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (shop.averageRating != null)
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: ScaledIcon(
                            Icons.star,
                            size: 17,
                          ),
                        ),
                        Text(
                          '${shop.averageRating}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  if (shop.type == ShopType.virtual)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        MdiIcons.instagram,
                        size: 14,
                        color: Colors.grey,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      shop.type == ShopType.virtual
                          ? shop.instagram!
                          : shop.address!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                shop.openingHours,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                shop.phone ?? '-',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
