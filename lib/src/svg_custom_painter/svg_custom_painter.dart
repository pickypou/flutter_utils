import 'package:flutter/material.dart';

class BubbleConfig {
  final Color borderColor;
  final Color fillColor;
  final String text;
  final TextStyle textStyle;
  final double width;
  final double height;

  BubbleConfig({
    required this.borderColor,
    this.fillColor = Colors.white,
    required this.text,
    required this.textStyle,
    required this.width,
    required this.height,
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

    // Utiliser les dimensions fournies dans config
    double scaleX = size.width / config.width;
    double scaleY = size.height / config.height;

    canvas.save();
    canvas.scale(scaleX, scaleY);

    // Tracer la bulle (ajusté pour utiliser les dimensions complètes)
    path.moveTo(9.49, 63.833);
    path.cubicTo(7.997, 63.833, 6.547, 63.593, 5.181, 63.12);
    path.lineTo(2.068, 62.043);
    path.lineTo(4.46, 59.778);
    path.cubicTo(7.625, 56.781, 8.424, 53.323, 8.476, 50.732);
    path.cubicTo(3.004, 44.666, 0, 37.097, 0, 29.334);
    path.cubicTo(0, 10.311, 20.645, 0.834, 50.333, 0.834);
    path.cubicTo(80.021, 0.834, 100.667, 10.311, 100.667, 29.334);
    path.cubicTo(100.667, 48.356, 80.021, 63.832, 50.333, 63.832);
    path.cubicTo(43.875, 63.832, 37.506, 62.433, 31.828, 59.775);
    path.cubicTo(18.689, 61.289, 14.366, 63.833, 9.49, 63.833);

    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    // Ajouter le texte centré et adapté à la bulle
    final textSpan = TextSpan(
      text: config.text,
      style: config.textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Adapter le texte à l'intérieur de la bulle
    double textMaxWidth = config.width * 0.8; // Réduire légèrement la largeur du texte
    textPainter.layout(minWidth: 0, maxWidth: textMaxWidth);

    // Calcul de la position pour centrer le texte
    final double textX = (config.width - textPainter.width) / 2;
    final double textY = (config.height - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(textX, textY));

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
