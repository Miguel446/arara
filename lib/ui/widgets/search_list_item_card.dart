import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../enums/color_enum.dart';

class SearchListItemCard extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final bool isOnline;
  final List<String> imgPathList;

  const SearchListItemCard({
    required this.title,
    required this.imgPathList,
    required this.subtitle1,
    required this.subtitle2,
    this.subtitle3 = '-',
    this.isOnline = false,
    super.key,
  });

  factory SearchListItemCard.physical({
    required String title,
    required List<String> imgPathList,
    required String address,
    required String horary,
    String phone = '-',
  }) {
    return SearchListItemCard(
      title: title,
      imgPathList: imgPathList,
      subtitle1: address,
      subtitle2: horary,
      subtitle3: phone,
      isOnline: false,
    );
  }

  factory SearchListItemCard.virtual({
    required String title,
    required List<String> imgPathList,
    required String instagram,
    required String phone,
    String paymentMethods = '-',
  }) {
    return SearchListItemCard(
      title: title,
      imgPathList: imgPathList,
      subtitle1: instagram,
      subtitle2: phone,
      subtitle3: paymentMethods,
      isOnline: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: ImageSlideshow(
              height: 200,
              indicatorRadius: 4,
              indicatorBackgroundColor: Colors.white70,
              indicatorColor: ColorEnum.verde,
              autoPlayInterval: 0,
              children: <Widget>[
                Image.asset(
                  imgPathList.elementAt(0),
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  imgPathList.elementAt(1),
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  imgPathList.elementAt(2),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Icon(
                  Icons.star,
                  color: ColorEnum.verde,
                  size: 17,
                ),
                const Text(
                  ' 4.98',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                if (isOnline)
                  const Icon(
                    MdiIcons.instagram,
                    size: 14,
                    color: Colors.grey,
                  ),
                Text(
                  isOnline ? ' $subtitle1' : subtitle1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subtitle2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subtitle3,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
