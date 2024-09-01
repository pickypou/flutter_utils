import 'package:example/widget/carousel/example_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'animation/example_animation.dart';

void main() {
  // Configure les valeurs de thème pour le projet
  ThemeConfig.primaryColor = Colors.green;
  ThemeConfig.secondaryColor = Colors.red;
  ThemeConfig.textColor = Colors.blue;
  ThemeConfig.fontFamily = 'Lora'; // Changer la police ici
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explication pour flutter-utils',
      theme: appTheme(context),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Comment me servir de flutter_utils',
              style: ThemeConfig.titleStyleMedium(context),
            ),
            const SizedBox(height: 50),
             ExampleAnimation(),
            const SizedBox(height: 50),
            const ExampleImageCarousel(),
          ],
        ),
      ),
      ),
    );
  }
}
