import 'package:flutter/material.dart';

class AccountMenuTitle extends StatelessWidget {
  final String title;
  const AccountMenuTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
