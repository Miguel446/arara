import 'package:flutter/material.dart';

class HomeBottomTabItem extends BottomNavigationBarItem {
  final IconData iconData;

  HomeBottomTabItem({
    required this.iconData,
  }) : super(
          icon: Icon(iconData),
          label: '',
        );
}
