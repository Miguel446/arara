import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/theme.dart';
import '../shared/extensions.dart';
import '../shared/models/shop.dart';
import '../shared/providers/shop_provider.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';
import '../widgets/image_carousel.dart';
import '../widgets/logo_app_bar.dart';
import 'shop_reviews_page.dart';

class ShopDetailPage extends ConsumerWidget {
  const ShopDetailPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncShop = ref.watch(shopProvider(shopId));

    return Scaffold(
      appBar: const LogoAppBar(),
      body: shop is Shop
          ? ShopDetailPageBody(shop as Shop)
          : asyncShop.when(
              data: (shop) => ShopDetailPageBody(shop),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => ErrorMessage(
                message: 'Erro ao carregar brechó',
                onRetry: () => ref.refresh(shopProvider(shopId)),
              ),
              skipLoadingOnRefresh: false,
            ),
    );
  }
}

class ShopDetailPageBody extends StatelessWidget {
  const ShopDetailPageBody(
    this.shop, {
    super.key,
  });

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppTheme.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (shop.imageUrls?.isNotEmpty == true)
            ImageCarousel(shop.imageUrls!),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              shop.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          if (shop.averageRating != null && shop.numberOfRatings != null)
            _IconText(
              Icons.star,
              '${shop.averageRating} | '
              '${shop.numberOfRatings!.withUnit('avaliação', 'avaliações')}',
            ),
          if (shop.address != null)
            _IconText(
              Icons.location_on,
              shop.address!,
            ),
          _IconText(
            Icons.access_time,
            shop.openingHours,
          ),
          if (shop.instagram != null)
            _IconText(
              MdiIcons.instagram,
              shop.instagram!,
            ),
          if (shop.phone != null)
            _IconText(
              Icons.phone,
              shop.phone!,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(color: Colors.grey[400]),
          ),
          if (shop.perks?.isNotEmpty == true)
            ...shop.perks!.map((perk) => _PerkTile(perk)).toList(),

          // Avaliações
          if (shop.reviews?.isNotEmpty == true) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Divider(color: Colors.grey[400]),
            ),
            ReviewCard.border(shop.reviews![0]),
            if (shop.numberOfRatings! > 1)
              TextButton(
                onPressed: () => context.push(
                  ShopReviewsPage.path.withId(shop.id),
                  extra: shop,
                ),
                child: Text(
                  'Mostrar todas as ${shop.numberOfRatings} avaliações',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(decoration: TextDecoration.underline),
                ),
              ),
          ],
        ],
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
