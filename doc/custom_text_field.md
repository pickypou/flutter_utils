# CustomTextField

A flexible wrapper around Flutter's standard `TextField` designed to enforce a consistent aesthetic while remaining easily customizable.

## Features

- Fully responsive to the application's `ThemeData` (Dark Mode / Light Mode).
- No hardcoded gray colors; respects `Theme.of(context).colorScheme`.
- Simplified parameters for quick styling (border radius, hint color, etc.).

## Usage

```dart
import 'package:flutter_utils/flutter_utils.dart';

Widget buildTextField() {
  return CustomTextField(
    hintText: 'Enter your email',
    keyboardType: TextInputType.emailAddress,
    obscureText: false,
    prefixIcon: const Icon(Icons.email),
    
    // Optional: override theme colors for this specific instance
    fillColor: Colors.blue.shade50,
    borderRadius: 12.0,
  );
}
```

## Theming
By default, `CustomTextField` will use your app's `ThemeData.inputDecorationTheme` or `ThemeData.colorScheme.surfaceContainerHighest` to determine its background color. Text and hint colors will be pulled from your `TextTheme`. This guarantees perfect consistency whether your app is in light or dark mode.
