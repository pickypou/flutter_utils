import 'package:flutter/material.dart';
import 'animated_opacity_fade.dart'; // Importez le fichier d'animation
import 'fade_transition_fade.dart'; // Importez le fichier d'animation

class ImageSlider extends StatelessWidget {
  final List<String> imagePaths;
  final bool useFadeTransition;
  final Duration duration;
  final Curve curve;

  const ImageSlider({
    super.key,
    required this.imagePaths,
    this.useFadeTransition = false,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        final image = Image.asset(imagePaths[index]);

        if (useFadeTransition) {
          return FadeTransitionFade(
            duration: duration,
            curve: curve,
            child: image,
          );
        } else {
          return AnimatedOpacityFade(
            duration: duration,
            curve: curve,
            child: image,
          );
        }
      },
    );
  }
}
