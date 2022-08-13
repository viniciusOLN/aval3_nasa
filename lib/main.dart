import 'package:flutter/material.dart';

import 'app/pages/homepage/homepage_screen.dart';

void main() {
  runApp(const UniverseGallery());
}

class UniverseGallery extends StatelessWidget {
  const UniverseGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria do Universo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
