import 'package:flutter/material.dart';

class SeeMoreItem extends StatelessWidget {
  const SeeMoreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Align(
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
