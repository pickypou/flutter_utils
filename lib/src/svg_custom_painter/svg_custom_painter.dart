import 'package:flutter/material.dart';

class BubbleConfig {
  final Color borderColor;
  final Color fillColor;
  final String text;
  final TextStyle textStyle;
  final double width;
  final double height;
  final double textXOffset; // Nouveau paramètre
  final double textYOffset; // Nouveau paramètre

  BubbleConfig({
    required this.borderColor,
    this.fillColor = Colors.white,
    required this.text,
    required this.textStyle,
    required this.width,
    required this.height,
    this.textXOffset = 0, // Valeur par défaut
    this.textYOffset = 0, // Valeur par défaut
  });
}

class SvgCustomPainter extends CustomPainter {
  final BubbleConfig config;

  SvgCustomPainter({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..color = config.fillColor
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Échelle basée sur la taille actuelle disponible (plus besoin de scaleX et scaleY)
    double width = size.width;
    double height = size.height;

    // Tracer la bulle proportionnellement à la nouvelle taille
    path.moveTo(9.49 / 100 * width, 63.833 / 100 * height);
    path.cubicTo(7.997 / 100 * width, 63.833 / 100 * height, 6.547 / 100 * width, 63.593 / 100 * height, 5.181 / 100 * width, 63.12 / 100 * height);
    path.lineTo(2.068 / 100 * width, 62.043 / 100 * height);
    path.lineTo(4.46 / 100 * width, 59.778 / 100 * height);
    path.cubicTo(7.625 / 100 * width, 56.781 / 100 * height, 8.424 / 100 * width, 53.323 / 100 * height, 8.476 / 100 * width, 50.732 / 100 * height);
    path.cubicTo(3.004 / 100 * width, 44.666 / 100 * height, 0, 37.097 / 100 * height, 0, 29.334 / 100 * height);
    path.cubicTo(0, 10.311 / 100 * height, 20.645 / 100 * width, 0.834 / 100 * height, 50.333 / 100 * width, 0.834 / 100 * height);
    path.cubicTo(80.021 / 100 * width, 0.834 / 100 * height, 100.667 / 100 * width, 10.311 / 100 * height, 100.667 / 100 * width, 29.334 / 100 * height);
    path.cubicTo(100.667 / 100 * width, 48.356 / 100 * height, 80.021 / 100 * width, 63.832 / 100 * height, 50.333 / 100 * width, 63.832 / 100 * height);
    path.cubicTo(43.875 / 100 * width, 63.832 / 100 * height, 37.506 / 100 * width, 62.433 / 100 * height, 31.828 / 100 * width, 59.775 / 100 * height);
    path.cubicTo(18.689 / 100 * width, 61.289 / 100 * height, 14.366 / 100 * width, 63.833 / 100 * height, 9.49 / 100 * width, 63.833 / 100 * height);

    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Ajouter le texte centré
    final textSpan = TextSpan(
      text: config.text,
      style: config.textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Ajuster la largeur et la hauteur du texte pour qu'il tienne dans la bulle
    textPainter.layout(minWidth: 0, maxWidth: size.width * 0.8); // 80% de la largeur pour le texte

    // Calculer la position du texte au centre de la bulle
    final double textX = (size.width - textPainter.width) / 2 + config.textXOffset;
    final double textY = (size.height - textPainter.height) / 2 + config.textYOffset;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
