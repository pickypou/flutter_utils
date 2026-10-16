import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The style of the comic bubble.
enum BubbleType {
  /// A classic comic speech bubble with a pointy tail.
  speech,

  /// A cloud-like thought bubble with puffy lobes and trailing circles.
  thought,
}

/// The position and direction of the bubble's tail or thought trail.
enum BubbleTailPosition {
  /// Tail pointing towards the bottom-left corner.
  bottomLeft,

  /// Tail pointing towards the bottom-right corner.
  bottomRight,

  /// Tail pointing towards the top-left corner.
  topLeft,

  /// Tail pointing towards the top-right corner.
  topRight,

  /// No tail (clean rounded oval or standalone cloud).
  none,
}

/// Configuration for styling, shaping, and positioning a comic-style bubble.
class BubbleConfig {
  /// The border outline color of the bubble.
  final Color borderColor;

  /// The inside fill color of the bubble.
  final Color fillColor;

  /// The text to display inside the bubble.
  final String text;

  /// The text style for the bubble content.
  final TextStyle textStyle;

  /// The base width of the bubble.
  final double width;

  /// The base height of the bubble.
  final double height;

  /// Horizontal offset adjustment for the text inside the bubble.
  final double textXOffset;

  /// Vertical offset adjustment for the text inside the bubble.
  final double textYOffset;

  /// The type of bubble: speech (pointy tail) or thought (cloud lobes).
  final BubbleType type;

  /// The position and direction of the bubble tail or thought trail.
  final BubbleTailPosition tailPosition;

  /// Border outline stroke width.
  final double strokeWidth;

  /// Creates a [BubbleConfig] instance.
  BubbleConfig({
    required this.borderColor,
    this.fillColor = Colors.white,
    required this.text,
    required this.textStyle,
    required this.width,
    required this.height,
    this.textXOffset = 0,
    this.textYOffset = 0,
    this.type = BubbleType.speech,
    this.tailPosition = BubbleTailPosition.bottomLeft,
    this.strokeWidth = 2.0,
  });

  /// Creates a copy of this [BubbleConfig] with the given fields replaced.
  BubbleConfig copyWith({
    Color? borderColor,
    Color? fillColor,
    String? text,
    TextStyle? textStyle,
    double? width,
    double? height,
    double? textXOffset,
    double? textYOffset,
    BubbleType? type,
    BubbleTailPosition? tailPosition,
    double? strokeWidth,
  }) {
    return BubbleConfig(
      borderColor: borderColor ?? this.borderColor,
      fillColor: fillColor ?? this.fillColor,
      text: text ?? this.text,
      textStyle: textStyle ?? this.textStyle,
      width: width ?? this.width,
      height: height ?? this.height,
      textXOffset: textXOffset ?? this.textXOffset,
      textYOffset: textYOffset ?? this.textYOffset,
      type: type ?? this.type,
      tailPosition: tailPosition ?? this.tailPosition,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BubbleConfig &&
        other.borderColor == borderColor &&
        other.fillColor == fillColor &&
        other.text == text &&
        other.textStyle == textStyle &&
        other.width == width &&
        other.height == height &&
        other.textXOffset == textXOffset &&
        other.textYOffset == textYOffset &&
        other.type == type &&
        other.tailPosition == tailPosition &&
        other.strokeWidth == strokeWidth;
  }

  @override
  int get hashCode {
    return Object.hash(
      borderColor,
      fillColor,
      text,
      textStyle,
      width,
      height,
      textXOffset,
      textYOffset,
      type,
      tailPosition,
      strokeWidth,
    );
  }
}

/// A custom painter that draws a comic speech or thought bubble according to a [BubbleConfig].
class SvgCustomPainter extends CustomPainter {
  /// The configuration defining colors, shape, and text of the bubble.
  final BubbleConfig config;

  /// Creates an [SvgCustomPainter] with the given [BubbleConfig].
  SvgCustomPainter({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = config.strokeWidth;

    final fillPaint = Paint()
      ..color = config.fillColor
      ..style = PaintingStyle.fill;

    double textCenterX = size.width / 2;
    double textCenterY = size.height / 2;

    if (config.type == BubbleType.thought) {
      final centers = _drawThoughtBubble(canvas, size, strokePaint, fillPaint);
      textCenterX = centers.dx;
      textCenterY = centers.dy;
    } else {
      _drawSpeechBubble(canvas, size, strokePaint, fillPaint);
    }

    // Centered text layout
    final textSpan = TextSpan(
      text: config.text,
      style: config.textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width * 0.75,
    );

    final double textX =
        textCenterX - (textPainter.width / 2) + config.textXOffset;
    final double textY =
        textCenterY - (textPainter.height / 2) + config.textYOffset;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  void _drawSpeechBubble(
    Canvas canvas,
    Size size,
    Paint strokePaint,
    Paint fillPaint,
  ) {
    if (config.tailPosition == BubbleTailPosition.none) {
      final strokeInset = config.strokeWidth / 2;
      final ovalRect = Rect.fromLTWH(
        strokeInset,
        strokeInset,
        size.width - config.strokeWidth,
        size.height - config.strokeWidth,
      );
      canvas.drawOval(ovalRect, fillPaint);
      canvas.drawOval(ovalRect, strokePaint);
      return;
    }

    canvas.save();
    switch (config.tailPosition) {
      case BubbleTailPosition.bottomLeft:
        break;
      case BubbleTailPosition.bottomRight:
        canvas.translate(size.width, 0);
        canvas.scale(-1, 1);
        break;
      case BubbleTailPosition.topLeft:
        canvas.translate(0, size.height);
        canvas.scale(1, -1);
        break;
      case BubbleTailPosition.topRight:
        canvas.translate(size.width, size.height);
        canvas.scale(-1, -1);
        break;
      case BubbleTailPosition.none:
        break;
    }

    final path = Path();
    final sx = size.width / 100.667;
    final sy = size.height / 63.833;

    path.moveTo(9.49 * sx, 63.833 * sy);
    path.cubicTo(7.997 * sx, 63.833 * sy, 6.547 * sx, 63.593 * sy, 5.181 * sx,
        63.12 * sy);
    path.lineTo(2.068 * sx, 62.043 * sy);
    path.lineTo(4.46 * sx, 59.778 * sy);
    path.cubicTo(7.625 * sx, 56.781 * sy, 8.424 * sx, 53.323 * sy, 8.476 * sx,
        50.732 * sy);
    path.cubicTo(3.004 * sx, 44.666 * sy, 0, 37.097 * sy, 0, 29.334 * sy);
    path.cubicTo(
        0, 10.311 * sy, 20.645 * sx, 0.834 * sy, 50.333 * sx, 0.834 * sy);
    path.cubicTo(80.021 * sx, 0.834 * sy, 100.667 * sx, 10.311 * sy,
        100.667 * sx, 29.334 * sy);
    path.cubicTo(100.667 * sx, 48.356 * sy, 80.021 * sx, 63.832 * sy,
        50.333 * sx, 63.832 * sy);
    path.cubicTo(43.875 * sx, 63.832 * sy, 37.506 * sx, 62.433 * sy,
        31.828 * sx, 59.775 * sy);
    path.cubicTo(18.689 * sx, 61.289 * sy, 14.366 * sx, 63.833 * sy, 9.49 * sx,
        63.833 * sy);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
    canvas.restore();
  }

  Offset _drawThoughtBubble(
    Canvas canvas,
    Size size,
    Paint strokePaint,
    Paint fillPaint,
  ) {
    final hasTail = config.tailPosition != BubbleTailPosition.none;

    double cloudCx = size.width / 2;
    double cloudCy = size.height / 2;
    double rx = size.width * 0.42;
    double ry = size.height * 0.38;

    if (hasTail) {
      switch (config.tailPosition) {
        case BubbleTailPosition.bottomLeft:
          cloudCx = size.width * 0.54;
          cloudCy = size.height * 0.44;
          rx = size.width * 0.42;
          ry = size.height * 0.36;
          break;
        case BubbleTailPosition.bottomRight:
          cloudCx = size.width * 0.46;
          cloudCy = size.height * 0.44;
          rx = size.width * 0.42;
          ry = size.height * 0.36;
          break;
        case BubbleTailPosition.topLeft:
          cloudCx = size.width * 0.54;
          cloudCy = size.height * 0.56;
          rx = size.width * 0.42;
          ry = size.height * 0.36;
          break;
        case BubbleTailPosition.topRight:
          cloudCx = size.width * 0.46;
          cloudCy = size.height * 0.56;
          rx = size.width * 0.42;
          ry = size.height * 0.36;
          break;
        case BubbleTailPosition.none:
          break;
      }
    }

    const int lobes = 12;
    const double dTheta = 2 * math.pi / lobes;
    final cloudPath = Path();

    final double startX = cloudCx + rx * math.cos(0);
    final double startY = cloudCy + ry * math.sin(0);
    cloudPath.moveTo(startX, startY);

    for (int i = 0; i < lobes; i++) {
      final double t1 = (i + 1) * dTheta;
      final double tMid = (i + 0.5) * dTheta;
      final double p1x = cloudCx + rx * math.cos(t1);
      final double p1y = cloudCy + ry * math.sin(t1);

      const double bulge = 1.25;
      final double cpx = cloudCx + rx * bulge * math.cos(tMid);
      final double cpy = cloudCy + ry * bulge * math.sin(tMid);
      cloudPath.quadraticBezierTo(cpx, cpy, p1x, p1y);
    }
    cloudPath.close();

    canvas.drawPath(cloudPath, fillPaint);
    canvas.drawPath(cloudPath, strokePaint);

    if (hasTail) {
      late final List<Offset> circleCenters;
      final List<double> radii = [
        size.width * 0.045,
        size.width * 0.030,
        size.width * 0.018,
      ];

      switch (config.tailPosition) {
        case BubbleTailPosition.bottomLeft:
          circleCenters = [
            Offset(size.width * 0.22, size.height * 0.78),
            Offset(size.width * 0.14, size.height * 0.88),
            Offset(size.width * 0.07, size.height * 0.95),
          ];
          break;
        case BubbleTailPosition.bottomRight:
          circleCenters = [
            Offset(size.width * 0.78, size.height * 0.78),
            Offset(size.width * 0.86, size.height * 0.88),
            Offset(size.width * 0.93, size.height * 0.95),
          ];
          break;
        case BubbleTailPosition.topLeft:
          circleCenters = [
            Offset(size.width * 0.22, size.height * 0.22),
            Offset(size.width * 0.14, size.height * 0.12),
            Offset(size.width * 0.07, size.height * 0.05),
          ];
          break;
        case BubbleTailPosition.topRight:
          circleCenters = [
            Offset(size.width * 0.78, size.height * 0.22),
            Offset(size.width * 0.86, size.height * 0.12),
            Offset(size.width * 0.93, size.height * 0.05),
          ];
          break;
        case BubbleTailPosition.none:
          circleCenters = [];
          break;
      }

      for (int i = 0; i < circleCenters.length; i++) {
        final center = circleCenters[i];
        final r = radii[i];
        canvas.drawCircle(center, r, fillPaint);
        canvas.drawCircle(center, r, strokePaint);
      }
    }

    return Offset(cloudCx, cloudCy);
  }

  @override
  bool shouldRepaint(covariant SvgCustomPainter oldDelegate) {
    return oldDelegate.config != config;
  }
}
