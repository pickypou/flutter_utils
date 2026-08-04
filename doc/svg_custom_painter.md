# SvgCustomPainter

`SvgCustomPainter` is a high-performance custom painter designed to draw SVG-like shapes (like speech bubbles) directly onto a Flutter canvas without needing heavy external SVG libraries. 

## Performance

The painter is highly optimized. It overrides `shouldRepaint` and implements `operator ==` on the `BubbleConfig` so that the canvas is **only redrawn when the configuration actually changes**, saving CPU and battery.

## Usage

```dart
import 'package:flutter_utils/flutter_utils.dart';

Widget buildBubble() {
  return CustomPaint(
    size: const Size(200, 100),
    painter: SvgCustomPainter(
      config: BubbleConfig(
        text: 'Hello World!',
        textStyle: const TextStyle(color: Colors.black, fontSize: 16),
        borderColor: Colors.blue,
        fillColor: Colors.lightBlueAccent,
        width: 200,
        height: 100,
        textXOffset: 0,
        textYOffset: -5,
      ),
    ),
  );
}
```

## BubbleConfig Options

- `borderColor`: The color of the bubble's stroke outline.
- `fillColor`: The background color inside the bubble.
- `text`: The text to display inside the bubble.
- `textStyle`: The styling of the text.
- `width` & `height`: The base dimensions used for path calculations.
- `textXOffset` & `textYOffset`: Fine-tuning coordinates to perfectly center the text within the bubble's optical center.
