import 'package:arara/config/theme.dart';
import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.title,
    required this.iconData,
    this.onPressed,
  });

  final String title;
  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.only(bottom: 8, top: 16),
        child: Row(
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
      ),
    );
  }
}
