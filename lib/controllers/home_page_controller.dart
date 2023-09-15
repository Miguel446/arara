import 'package:flutter/material.dart';

import '../pages/reviews_page.dart';
import '../pages/shops_page.dart';
import '../pages/news_page.dart';
import '../pages/profile_page.dart';

class HomePageController extends ChangeNotifier {
  int currentPageIndex = 0;
  IconData buttonIcon = Icons.explore;
  String buttonText = 'Explore ';

  final telas = <Widget>[
    const ShopsPage(),
    const NewsPage(),
    const ReviewsPage(),
    const ProfilePage()
  ];

  bool get isButtonVisible => currentPageIndex == 0 || currentPageIndex == 2;
  Widget get currentTab => telas.elementAt(currentPageIndex);

  void changeTab(int index) {
    currentPageIndex = index;
    if (index == 2) {
      buttonText = "Avaliar ";
      buttonIcon = Icons.reviews;
    } else {
      buttonText = "Explore ";
      buttonIcon = Icons.explore;
    }

    notifyListeners();
  }
}
