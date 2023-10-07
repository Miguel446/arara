import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../config/theme.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel(
    this.imageUrls, {
    super.key,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: ImageSlideshow(
        height: 200,
        indicatorRadius: 4,
        indicatorBackgroundColor: Colors.white70,
        indicatorColor: AppTheme.secondary,
        autoPlayInterval: 0,
        children: imageUrls.map(
          (uri) {
            if (uri.startsWith('http')) {
              return Image.network(
                uri,
                fit: BoxFit.cover,
              );
            }

            return Image.asset(
              uri,
              fit: BoxFit.cover,
            );
          },
        ).toList(),
      ),
    );
  }
}
