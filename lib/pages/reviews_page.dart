import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/review_item.dart';
import '../widgets/see_more_item.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppLogo(
                  padding: EdgeInsets.only(top: 10),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Avaliações',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                ReviewItem(imgPathList: [
                  'assets/brecho3.png',
                  'assets/brecho32.jpeg',
                  'assets/brecho33.jpeg'
                ], title: 'Brechó Stylus'),
                ReviewItem(imgPathList: [
                  'assets/brecho2.png',
                  'assets/brecho22.jpeg',
                  'assets/brecho23.jpeg'
                ], title: 'Brechó de Elite'),
                SeeMoreItem(
                  marginBottom: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
