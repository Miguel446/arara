import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../controllers/home_page_controller.dart';
import '../widgets/home_bottom_tab_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomePageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.currentTab,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentPageIndex,
        onTap: controller.changeTab,
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
        visible: controller.isButtonVisible,
        child: FloatingActionButton.extended(
          backgroundColor: AppTheme.primary,
          onPressed: () {},
          label: Row(
            children: [
              Text(
                controller.buttonText,
                style: const TextStyle(color: Colors.white),
              ),
              Icon(
                controller.buttonIcon,
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
