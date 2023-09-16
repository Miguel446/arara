import 'package:flutter/material.dart';

import '../widgets/logo_app_bar.dart';

class ShopDetailPage extends StatelessWidget {
  const ShopDetailPage(this.shopId, {super.key});

  final String shopId;

  static const path = '/brecho/:id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
    );
  }
}
