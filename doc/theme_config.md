# Theme Config

`ThemeConfig` is a utility designed to help manage typography, text scaling, and core colors consistently across your application. 

It prevents issues such as unreadably small text on mobile devices or excessively large text on web/desktop targets by utilizing dynamic scaling with boundaries (`clamp`).

## Usage

Define your colors and fonts globally (or inject them via your app's initialization):

```dart
import 'package:flutter_utils/flutter_utils.dart';

void main() {
  ThemeConfig.primaryColor = Colors.yellow;
  ThemeConfig.secondaryColor = Colors.red;
  ThemeConfig.textColor = Colors.blue;
  ThemeConfig.fontFamily = 'Lora'; 

  runApp(const MyApp());
}
```

Apply the theme to your `MaterialApp`:

```dart
MaterialApp(
  title: 'My App',
  theme: appTheme(context), // Generates ThemeData based on ThemeConfig
  home: const Home(),
);
```

Access responsive `TextStyle` anywhere in your code:

```dart
Text(
  'Hello World',
  style: ThemeConfig.titleStyleMedium(context),
)
```
