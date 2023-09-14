import 'package:flutter/material.dart';

import '../ui/widgets/review_item.dart';
import '../ui/widgets/see_more_item.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: const Image(
                      height: 80,
                      image: AssetImage('assets/icone.png'),
                    )),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Avaliações',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                const ReviewItem(imgPathList: [
                  'assets/brecho3.png',
                  'assets/brecho32.jpeg',
                  'assets/brecho33.jpeg'
                ], title: 'Brechó Stylus'),
                const ReviewItem(imgPathList: [
                  'assets/brecho2.png',
                  'assets/brecho22.jpeg',
                  'assets/brecho23.jpeg'
                ], title: 'Brechó de Elite'),
                const SeeMoreItem(
                  marginBottom: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
