import 'package:flutter/material.dart';
import 'dart:math' as math; // Ajout de l'import dart:math

enum PointPosition { left, center, right }

class OvalSpeechBubble extends StatelessWidget {
  final String text;
  final Color borderColor;
  final double borderWidth;
  final double bubbleWidth;
  final double bubbleHeight;
  final PointPosition pointPosition;

  const OvalSpeechBubble({super.key,
    required this.text,
    this.borderColor = const Color(0xFF8E44AD),
    this.borderWidth = 2.0,
    this.bubbleWidth = 300,
    this.bubbleHeight = 200,
    this.pointPosition = PointPosition.center,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OvalBubblePainter(
        borderColor: borderColor,
        borderWidth: borderWidth,
        pointPosition: pointPosition,
      ),
      child: Container(
        width: bubbleWidth,
        height: bubbleHeight + 20,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class OvalBubblePainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;
  final PointPosition pointPosition;

  OvalBubblePainter({
    required this.borderColor,
    required this.borderWidth,
    required this.pointPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final ovalRect = Rect.fromLTWH(0, 0, size.width, size.height - 20);
    final path = Path();

    // Calculate the angle for the point based on its position
    final pointAngle = _getPointAngle(pointPosition);

    // Start drawing from the point
    final startX = size.width / 2+ (size.width /2) * math.cos(pointAngle);
    final startY = (size.height - 20) / 2 + ((size.height - 20) / 2) * math.sin(pointAngle);

    path.moveTo(startX, startY);

    // Draw the oval
    for (double t = 0; t <= 2 * math.pi; t += 0.01) {
      if (t.abs() - pointAngle.abs() < 0.1) continue; // Skip the point area
      final x = size.width / 2 + (size.width / 2) * math.cos(t);
      final y = (size.height - 20) / 2 + ((size.height - 20) / 2) * math.sin(t);
      path.lineTo(x, y);
    }

    // Draw the point
    final pointX = _getPointX(size.width);
    path.lineTo(pointX, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  double _getPointAngle(PointPosition position) {
    switch (position) {
      case PointPosition.left:
        return math.pi / 4 * 3;
      case PointPosition.right:
        return math.pi / 4;
      case PointPosition.center:
      default:
        return math.pi / 2;
    }
  }

  double _getPointX(double width) {
    switch (pointPosition) {
      case PointPosition.left:
        return width * 0.25;
      case PointPosition.right:
        return width * 0.75;
      case PointPosition.center:
      default:
        return width * 0.5;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
