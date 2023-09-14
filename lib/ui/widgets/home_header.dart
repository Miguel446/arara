import 'package:flutter/material.dart';

import '../../enums/color_enum.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      collapsedHeight: 217.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Image(
                height: 80,
                image: AssetImage('assets/icone.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(24),
                      right: Radius.circular(24),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_alt),
                  hintText: 'Procure por bazares e brechós',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    transform: Matrix4.translationValues(0, 38.45, 0),
                    child: const Divider(
                      thickness: 1.2,
                      color: Colors.grey,
                    ),
                  ),
                  const TabBar(
                    labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.symmetric(horizontal: 70),
                      borderSide: BorderSide(
                        color: ColorEnum.roxo,
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                    tabs: [
                      Tab(text: 'Espaços físicos'),
                      Tab(text: 'Espaços virtuais'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
