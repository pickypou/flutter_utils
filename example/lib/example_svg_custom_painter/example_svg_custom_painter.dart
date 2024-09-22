import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';
import '../../theme_config.dart';


class ExampleSvgCustomPainter extends StatelessWidget {
  final double width;
  final double height;
  final double textXOffset;
  final double textYOffset;

  const ExampleSvgCustomPainter({
    super.key,
    this.width = 300,
    this.height = 150,
    this.textXOffset = 0,
    this.textYOffset = -30, // Ajustez cette valeur pour déplacer le texte vers le haut
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: CustomPaint(
        painter: SvgCustomPainter(
          config: BubbleConfig(
            borderColor: Colors.cyanAccent,
            fillColor: Colors.transparent,
            text: "Je suis là pour vous aider à retrouver équilibre, relaxation & bien-être. Que vous souffriez de maux physiques ou émotionnels",
            textStyle: const TextStyle(fontSize: 14,),
            width: width,
            height: height,
            textXOffset: textXOffset,
            textYOffset: textYOffset,
          ),
        ),
      ),
    );
  }
}