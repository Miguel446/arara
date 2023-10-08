import 'package:arara/config/theme.dart';
import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;

  const AccountMenuItem(
      {super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  iconData,
                  size: 22,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppTheme.primary,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
