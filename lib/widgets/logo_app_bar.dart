import 'package:flutter/material.dart';

import 'app_logo.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  static const toolbarHeight = 75.0;

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppLogo(),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: true,
      toolbarHeight: toolbarHeight,
      actions: actions,
    );
  }
}
