import 'package:example/example_svg_custom_painter/example_svg_custom_painter.dart';
import 'package:example/models/hike.dart';
import 'package:example/widget/example_custom_text_field/example_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import 'animation/example_animation.dart';

void main() {
  // Configure les valeurs de thème pour le projet
  ThemeConfig.primaryColor = Colors.yellow;
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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
// Simulons un objet 'Hike' pour l'exemple
  final Hike hike = Hike(
    id: '1',
    title: 'Randonnée en montagne',
    description: 'Une belle randonnée en montagne avec vue sur la vallée.',
    imgUrls: ['https://example.com/img1.jpg', 'https://example.com/img2.jpg'],

  );
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
              // Utilisation de SizedBox ou Expanded pour limiter la taille

              const SizedBox(height: 50),
              const ExampleCustomTextField(),
              const ExampleSvgCustomPainter()
            ],
          ),
        ),
      ),
    );
  }
}


