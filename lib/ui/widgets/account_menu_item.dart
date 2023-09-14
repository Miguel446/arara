import 'package:flutter/material.dart';

import '../../enums/color_enum.dart';

class AccountMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;

  const AccountMenuItem(
      {super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(
                      iconData,
                      color: ColorEnum.verde,
                      size: 22,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: ColorEnum.roxo,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}