import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/shop_detail_page.dart';
import '../pages/shop_reviews_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: LoginPage.path, builder: (_, __) => const LoginPage()),
    GoRoute(path: HomePage.path, builder: (_, __) => const HomePage()),
    GoRoute(
      path: ShopDetailPage.path,
      builder: (_, state) => ShopDetailPage(
        state.pathParameters['id']!,
        shop: state.extra,
      ),
    ),
    GoRoute(
      path: ShopReviewsPage.path,
      builder: (_, state) => ShopReviewsPage(
        state.pathParameters['id']!,
        shop: state.extra,
      ),
    ),
  ],
);
