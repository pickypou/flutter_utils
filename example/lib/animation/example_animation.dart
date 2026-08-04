import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleAnimation extends StatelessWidget {
  ExampleAnimation({super.key});

  final List<String> images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animations Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Image Slider",
              style: ThemeConfig.textStyleText(context),
            ),
            const SizedBox(height: 20),
            ImageSlider(
              imagePaths: images,
              useFadeTransition: true,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 40),
            Text(
              "Animated Opacity Fade",
              style: ThemeConfig.textStyleText(context),
            ),
            const SizedBox(height: 20),
            AnimatedOpacityFade(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Image.asset("assets/images/img1.png"),
            ),
          ],
        ),
      ),
    );
  }
}
