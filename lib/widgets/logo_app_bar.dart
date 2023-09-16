import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
    this.actions,
  });

  final List<Widget>? actions;

  static const toolbarHeight = 100.0;

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/icone.png', height: 80),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: true,
      toolbarHeight: toolbarHeight,
      actions: actions,
    );
  }
}
