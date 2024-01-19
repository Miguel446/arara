import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/theme.dart';
import '../models/shop.dart';
import '../providers/reviews_provider.dart';
import '../providers/shop_provider.dart';
import '../providers/shop_with_reviews_provider.dart';
import '../utils/extensions.dart';
import '../widgets/card/review_card.dart';
import '../widgets/error_message.dart';
import '../widgets/image_carousel.dart';
import '../widgets/logo_app_bar.dart';
import '../widgets/scaled_icon.dart';
import 'shop_reviews_page.dart';

class ShopDetailPage extends ConsumerWidget {
  const ShopDetailPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(shopWithReviewsProvider(shopId));

    return Scaffold(
      appBar: const LogoAppBar(),
      body: asyncData.when(
        data: (data) => ShopDetailPageBody(data.shop, data.reviews),
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
    this.shop,
    this.reviews, {
    super.key,
  });

  final Shop shop;
  final Reviews reviews;

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
          if (shop.averageRating != null)
            _IconText(
              Icons.star,
              '${shop.averageRating} | '
              '${reviews.length.withUnit('avaliação', 'avaliações')}',
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
          if (shop.perks?.isNotEmpty == true) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(),
            ),
            ...shop.perks!.map((perk) => _PerkTile(perk)),
          ],

          // Avaliações
          if (reviews.isNotEmpty == true) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(),
            ),
            ReviewCard.border(reviews[0]),
            if (reviews.length > 1)
              TextButton(
                onPressed: () => context.push(
                  ShopReviewsPage.path.withId(shop.id),
                  extra: (shop: shop, reviews: reviews),
                ),
                child: Text(
                  'Mostrar todas as ${reviews.length} avaliações',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScaledIcon(icon, size: 17),
          const SizedBox(width: 3),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
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
          ScaledIcon(perk.icon),
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
