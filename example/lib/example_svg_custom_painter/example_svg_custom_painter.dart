import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'svg_custom_painter.dart'; // Assurez-vous d'importer votre fichier

class ExampleSvgCustomPainter extends StatelessWidget {
  const ExampleSvgCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Taille de la bulle
      height: 300,
      child: CustomPaint(
        painter: SvgCustomPainter(
          config: BubbleConfig(
            borderColor: Theme.of(context).colorScheme.secondary,
            fillColor: Colors.transparent,
            text: 'Je suis là pour vous aider à retrouver équilibre, relaxation & bien-être. Que vous souffriez de maux physiques ou émotionnels.',
            textStyle: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
            width: 300, // Assurez-vous que la largeur est en cohérence avec le conteneur
            height: 300,
          ),
        ),
      ),
    );
  }
}
