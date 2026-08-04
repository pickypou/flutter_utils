# Orientation & Size Extensions

This module provides helpful extensions on `Size` to easily build responsive layouts without boilerplate.

## Features

- **SizeOrientation**: Enum standardizing orientation (`portrait`, `landscape`, `square`).
- **orientation()**: Get the screen orientation directly from a `Size` object.
- **max()**: Get the maximum dimension of the screen.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

Widget build(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);

  if (size.orientation() == SizeOrientation.landscape) {
    return Text('Landscape Mode');
  } else {
    return Text('Portrait or Square Mode');
  }
}
```

## Responsive Wrappers
- **OrientationSizeBox**: Wraps content and automatically sizes it based on a fraction of the screen when in landscape, or full width in portrait.
- **OrientationStack**: A smart widget that renders its children in a `Row` if the screen is landscape, or a `Column` if the screen is portrait, adapting automatically to the device's aspect ratio.
