import 'package:flutter/material.dart';

class SeeMoreItem extends StatelessWidget {
  final double marginTop;
  final double marginBottom;

  const SeeMoreItem({super.key, this.marginTop = 0, this.marginBottom = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Ver mais',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
