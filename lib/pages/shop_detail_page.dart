import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/theme.dart';
import '../shared/extensions.dart';
import '../shared/repositories/shop_repository.dart';
import '../widgets/card/last_review_card.dart';
import '../widgets/image_carousel.dart';
import '../widgets/logo_app_bar.dart';
import 'shop_reviews_page.dart';

class ShopDetailPage extends StatefulWidget {
  const ShopDetailPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id';

  @override
  State<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends State<ShopDetailPage> {
  Shop? shop;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.shop is Shop) {
      shop = widget.shop as Shop;
    } else {
      getShop();
    }
  }

  Future<void> getShop() async {
    setState(() => isLoading = true);

    try {
      shop = await GetIt.I<ShopRepository>().getShopById(widget.shopId);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: SingleChildScrollView(
        padding: AppTheme.pagePadding,
        child: shop == null
            ? null
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (shop!.imageUrls?.isNotEmpty == true)
                    ImageCarousel(shop!.imageUrls!),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      shop!.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  if (shop!.averageRating != null &&
                      shop!.numberOfRatings != null)
                    _IconText(
                      Icons.star,
                      '${shop!.averageRating} | '
                      '${shop!.numberOfRatings!.withUnit('avaliação', 'avaliações')}',
                    ),
                  if (shop!.address != null)
                    _IconText(
                      Icons.location_on,
                      shop!.address!,
                    ),
                  _IconText(
                    Icons.access_time,
                    shop!.openingHours,
                  ),
                  if (shop!.instagram != null)
                    _IconText(
                      MdiIcons.instagram,
                      shop!.instagram!,
                    ),
                  if (shop!.phone != null)
                    _IconText(
                      Icons.phone,
                      shop!.phone!,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Divider(color: Colors.grey[400]),
                  ),
                  if (shop!.perks?.isNotEmpty == true)
                    ...shop!.perks!.map((perk) => _PerkTile(perk)).toList(),

                  // Avaliações
                  if (shop!.reviews?.isNotEmpty == true) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Divider(color: Colors.grey[400]),
                    ),
                    LastReviewCard(shop!.reviews![0]),
                    if (shop!.numberOfRatings! > 1)
                      TextButton(
                        onPressed: () => context.push(
                          ShopReviewsPage.path.withId(widget.shopId),
                          extra: shop,
                        ),
                        child: Text(
                          'Mostrar todas as ${shop!.numberOfRatings} avaliações',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                  ],
                ],
              ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 17),
          const SizedBox(width: 3),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _PerkTile extends StatelessWidget {
  const _PerkTile(this.perk);

  final ShopPerk perk;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(perk.icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  perk.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  perk.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.black600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
