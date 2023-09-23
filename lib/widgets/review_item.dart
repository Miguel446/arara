import 'package:flutter/material.dart';

import 'image_carousel.dart';

class ReviewItem extends StatelessWidget {
  final String title;
  final List<String> imgPathList;

  const ReviewItem({super.key, required this.imgPathList, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          ImageCarousel(imgPathList),
          // Titulo
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Avaliacao
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Row(
              children: [
                Icon(
                  Icons.star,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  size: 17,
                ),
                Text(
                  ' 1 dia atrás',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                )
              ],
            ),
          ),
          // Texto
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                        text:
                            "“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua....” ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Ler mais',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ))
                        ]),
                  ),
                )
              ],
            ),
          ),
          // Autor
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: const Row(
              children: [
                Text(
                  'Luciana Valadares',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}