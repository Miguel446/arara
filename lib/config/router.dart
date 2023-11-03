import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/news_detail_page.dart';
import '../pages/settings/accessibility_page.dart';
import '../pages/shop_detail_page.dart';
import '../pages/shop_reviews_page.dart';
import '../providers/user_provider.dart';

final router = GoRouter(
  initialLocation: UserNotifier.isUserSet ? HomePage.path : LoginPage.path,
  routes: [
    GoRoute(path: LoginPage.path, builder: (_, __) => const LoginPage()),
    GoRoute(path: HomePage.path, builder: (_, __) => const HomePage()),

    // Brechós
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

    // Notícias
    GoRoute(
      path: NewsDetailPage.path,
      builder: (_, state) => NewsDetailPage(
        state.pathParameters['id']!,
      ),
    ),

    // Configurações
    GoRoute(
      path: AccessibilityPage.path,
      builder: (_, __) => const AccessibilityPage(),
    ),
  ],
);
