# Flutter Kit Utils

[![pub package](https://img.shields.io/pub/v/flutter_kit_utils.svg)](https://pub.dev/packages/flutter_kit_utils)
[![pub points](https://img.shields.io/pub/points/flutter_kit_utils?color=2E8B57)](https://pub.dev/packages/flutter_kit_utils/score)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A robust and reusable collection of Flutter widgets, animations, orientation helpers, speech bubbles, and utility functions designed to accelerate app development.

## Features

- **Theme Management**: Easily manage your app's global text scaling and colors.
- **Image Carousel**: Configurable carousels with individual image cropping capabilities via `CropConfig`.
- **Animations**: Ready-to-use animations like fade transitions and opacity fades.
- **Custom Widgets**: Pre-built, customizable UI elements such as `CustomTextField`, `CustomButton`, and comic speech & thought cloud bubbles via `SvgCustomPainter` (supporting multiple tail directions and trailing dots).
- **Orientation Utilities**: Extensions for `Size` (`orientation()`, `max()`) and responsive layout widgets (`OrientationSizeBox`, `OrientationStack`).

## Documentation

Comprehensive documentation for each module can be found in the `doc/` directory:

- [Theme Configuration](doc/theme_config.md)
- [Image Carousel](doc/image_carousel.md)
- [Animations](doc/animations.md)
- [SVG Custom Painter (Speech & Thought Bubbles)](doc/svg_custom_painter.md)
- [Custom TextField](doc/custom_text_field.md)
- [Custom Button](doc/custom_button.md)
- [Orientation & Size Extensions](doc/orientation_and_size.md)

## Installation

Add this line to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_kit_utils: ^0.1.0
```

Or reference it from your git repository:

```yaml
dependencies:
  flutter_kit_utils:
    git:
      url: https://github.com/pickypou/flutter_utils.git
      ref: main
```

## Example

Check out the `example/` folder for a complete working example demonstrating how to use all the utilities included in this package.

## 💼 Need a Flutter Developer for Your Project?

I am an independent Flutter developer available for freelance contracts (mobile iOS/Android & Web). Whether you need complete app development, custom component creation, or subcontracting support for your agency:

- 📧 **Email**: [spysschaert.ludo@gmail.com](mailto:spysschaert.ludo@gmail.com)
- 🐙 **GitHub**: [github.com/pickypou](https://github.com/pickypou)
- 💬 **Services**: Mobile & Web App Development, UI/UX Implementation, Bug Fixing, Component Libraries

Feel free to reach out to discuss your project!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
