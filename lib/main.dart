import 'package:flutter/material.dart';

import 'shared/dependencies.dart';
import 'shared/palette.dart';
import 'ui/pages/home_page.dart';

void main() {
  registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arara',
      theme: ThemeData(
        primarySwatch: Palette.paletaRoxa,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
