import 'package:flutter/material.dart';

class SpeechBubble extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final bubblePath = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.5, 0, size.width, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.5, size.height, 0, size.height * 0.8)
      ..close();

    // Queue de la bulle
    final tailPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.8)
      ..lineTo(size.width * 0.35, size.height)
      ..lineTo(size.width * 0.45, size.height * 0.8)
      ..close();

    canvas.drawPath(bubblePath, paint);
    canvas.drawPath(tailPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
