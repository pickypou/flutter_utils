# SvgCustomPainter

`SvgCustomPainter` is a high-performance vector painter designed to draw comic-style speech bubbles and thought clouds directly onto a Flutter canvas without needing heavy external SVG libraries or assets.

## Performance

The painter is highly optimized:
- **Zero external asset dependencies**: Pure Canvas vector paths.
- **Smart repainting**: Implements `operator ==` and `hashCode` on `BubbleConfig` and checks `shouldRepaint` so that the canvas is **only redrawn when the configuration actually changes**, saving CPU and battery.

## Usage

### 1. Classic Comic Speech Bubble (Bulle de parole)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

Widget buildSpeechBubble() {
  return CustomPaint(
    size: const Size(260, 130),
    painter: SvgCustomPainter(
      config: BubbleConfig(
        type: BubbleType.speech,
        tailPosition: BubbleTailPosition.bottomLeft,
        text: 'Bonjour ! Bienvenue sur Flutter Kit Utils.',
        textStyle: const TextStyle(color: Colors.black87, fontSize: 14),
        borderColor: Colors.black87,
        fillColor: const Color(0xFFFFF9C4),
        strokeWidth: 2.0,
        width: 260,
        height: 130,
      ),
    ),
  );
}
```

### 2. Comic Thought Bubble / Cloud (Nuage de pensée)

```dart
Widget buildThoughtBubble() {
  return CustomPaint(
    size: const Size(280, 150),
    painter: SvgCustomPainter(
      config: BubbleConfig(
        type: BubbleType.thought,
        tailPosition: BubbleTailPosition.bottomRight,
        text: 'Hmm... Une idée géniale pour mon application !',
        textStyle: const TextStyle(
          color: Colors.indigo,
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
        borderColor: Colors.indigo,
        fillColor: const Color(0xFFE8EAF6),
        strokeWidth: 2.0,
        width: 280,
        height: 150,
      ),
    ),
  );
}
```

## BubbleConfig Options

- `type`: The bubble style, either `BubbleType.speech` (classic pointed tail) or `BubbleType.thought` (puffy cloud lobes with trailing bubbles). Defaults to `BubbleType.speech`.
- `tailPosition`: Direction/corner of the tail or thought trail (`BubbleTailPosition.bottomLeft`, `bottomRight`, `topLeft`, `topRight`, or `none`). Defaults to `BubbleTailPosition.bottomLeft`.
- `borderColor`: The stroke outline color.
- `fillColor`: The background inside color. Defaults to `Colors.white`.
- `strokeWidth`: Stroke width of the outline and trail circles. Defaults to `2.0`.
- `text`: The string displayed inside the bubble.
- `textStyle`: The styling of the text.
- `width` & `height`: Dimensions used for canvas layout calculations.
- `textXOffset` & `textYOffset`: Fine-tuning offsets to adjust text position if needed.
