import 'package:flutter/widgets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 80, this.padding = EdgeInsets.zero});

  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset('assets/icone.png', height: height),
    );
  }
}
