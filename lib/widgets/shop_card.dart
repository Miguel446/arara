import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../shared/models/shop.dart';
import '../config/theme.dart';
import '../pages/shop_detail_page.dart';
import '../shared/extensions.dart';

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
              ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: ImageSlideshow(
                  height: 200,
                  indicatorRadius: 4,
                  indicatorBackgroundColor: Colors.white70,
                  indicatorColor: AppTheme.secondary,
                  autoPlayInterval: 0,
                  children: shop.imageUrls!
                      .map(
                        (url) => Image.asset(
                          url,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (shop.averageRating != null) ...[
                    const Icon(
                      Icons.star,
                      size: 17,
                    ),
                    Text(
                      '${shop.averageRating}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]
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
                  Text(
                    shop.type == ShopType.virtual
                        ? shop.instagram!
                        : shop.address!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
