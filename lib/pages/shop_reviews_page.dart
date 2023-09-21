import 'package:flutter/material.dart';

class ShopReviewsPage extends StatelessWidget {
  const ShopReviewsPage(this.shopId, {super.key, this.shop});

  final String shopId;
  final Object? shop;
  static const path = '/brecho/:id/avaliacoes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   shop!.name,
          // ),
          ),
    );
  }
}
