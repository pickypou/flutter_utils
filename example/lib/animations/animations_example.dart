
import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class AnimationExample extends StatelessWidget {
   const AnimationExample({ super.key});
  @override
  Widget build(BuildContext context) {
   // List des chemins des images
    final List<String> imagePaths = [
      'assets/images/img1.jpeg',
      'assets/images/img2.jpeg',
      'assets/images/img3.jpeg',
    ];
    return ImageSlider(imagePaths: imagePaths,
    useFadeTransition: true, //pour l'utilisation de FadeTransitionFade false pour utiliser AnimatedOpacityFade
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
  }

}
