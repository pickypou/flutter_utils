# CustomButton

A highly customizable and reusable button widget that wraps Flutter's `ElevatedButton`.

## Features

- **100% Configurable:** Adjust size (width/height), border radius, border thickness/color, background color, and text color.
- **Shadows & Elevation:** Native support for customizing the shadow color and elevation depth.
- **Icon Support:** Easily add a leading icon next to your text.
- **Responsive to Theme:** Automatically falls back to `Theme.of(context).colorScheme.primary` if no explicit colors are provided.

## Usage

```dart
import 'package:flutter_utils/flutter_utils.dart';

Widget buildButton() {
  return CustomButton(
    text: 'Click Me!',
    onPressed: () {
      print('Button pressed');
    },
    
    // Optional customization
    width: 200,
    height: 50,
    backgroundColor: Colors.blueAccent,
    foregroundColor: Colors.white,
    borderRadius: 25.0,
    elevation: 8.0,
    shadowColor: Colors.blue.withOpacity(0.5),
    icon: const Icon(Icons.thumb_up, size: 20),
    border: const BorderSide(color: Colors.blue, width: 2),
  );
}
```
