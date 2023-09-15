import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../widgets/home_bottom_tab_item.dart';
import 'news_page.dart';
import 'profile_page.dart';
import 'reviews_page.dart';
import 'shops_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  IconData buttonIcon = Icons.explore;
  String buttonText = 'Explore ';

  final pages = [
    const ShopsPage(),
    const NewsPage(),
    const ReviewsPage(),
    const ProfilePage()
  ];

  bool get isButtonVisible => [0, 2].contains(currentPageIndex);
  Widget get currentTab => pages.elementAt(currentPageIndex);

  void changeTab(int index) {
    setState(() {
      currentPageIndex = index;
      if (index == 2) {
        buttonText = "Avaliar ";
        buttonIcon = Icons.reviews;
      } else {
        buttonText = "Explore ";
        buttonIcon = Icons.explore;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentTab,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: changeTab,
        unselectedItemColor: const Color(0x801E1E1E),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        items: [
          HomeBottomTabItem(iconData: Icons.search),
          HomeBottomTabItem(iconData: Icons.feed),
          HomeBottomTabItem(iconData: Icons.reviews),
          HomeBottomTabItem(iconData: Icons.account_circle),
        ],
      ),
      floatingActionButton: Visibility(
        visible: isButtonVisible,
        child: FloatingActionButton.extended(
          backgroundColor: AppTheme.primary,
          onPressed: () {},
          label: Row(
            children: [
              Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
