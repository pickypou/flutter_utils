## 0.1.0

* **Enhanced Comic Speech & Thought Bubbles (`SvgCustomPainter`)**:
  * Added `BubbleType` enum: support for classic comic dialogue (`speech`) and cloud thought bubbles (`thought`).
  * Added `BubbleTailPosition` enum: customize the tail/trail corner (`bottomLeft`, `bottomRight`, `topLeft`, `topRight`, or `none`).
  * Thought bubbles feature authentic cloud lobes with 3 decreasing trailing circles pointing towards the thinker.
  * Added `strokeWidth` and `copyWith` to `BubbleConfig`.
  * Fully backward-compatible defaults.
* **Example Application**:
  * Added interactive showcase with live switches for bubble styles and tail directions.
* **Tests**:
  * Added complete unit tests covering all bubble types, orientations, and configurations.

## 0.0.1

* Initial release of `flutter_kit_utils`.
* **Animations**: Added `AnimatedOpacityFade`, `FadeTransitionFade`, and `ImageSlider`.
* **Image Carousel**: Added `ImageCarousel` with customizable cropping via `CropConfig`.
* **Custom Widgets**: Added `CustomButton`, `CustomTextField`, and speech bubble drawing via `SvgCustomPainter`.
* **Orientation & Size Utilities**: Added `OrientationSizeBox`, `OrientationStack`, and `Size` extensions (`orientation()`, `max()`).
* **Theme Management**: Added `ThemeConfig` and `appTheme` helper.
