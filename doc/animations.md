# Animations

The animations module provides simple, ready-to-use widgets to animate visibility and transitions effortlessly.

## ImageSlider

A widget that automatically cycles through a list of image assets with smooth fading transitions.

**Features:**
- Automatic `Timer.periodic` handling.
- Pre-caching of images to prevent visual glitches/flickering.
- Customizable fade durations and curves.

**Usage:**
```dart
ImageSlider(
  imagePaths: [
    'assets/images/slide1.png',
    'assets/images/slide2.png',
  ],
  duration: const Duration(seconds: 4),
  curve: Curves.easeIn,
)
```

## AnimatedOpacityFade

A simple wrapper around `AnimatedBuilder` and `Opacity` that fades its child in over a specified duration using an `AnimationController`.

**Usage:**
```dart
AnimatedOpacityFade(
  duration: const Duration(seconds: 2),
  child: Text('I will fade in smoothly!'),
)
```

## FadeTransitionFade

A simpler alternative using `TweenAnimationBuilder` to achieve a one-off fade transition when the widget is first built.

**Usage:**
```dart
FadeTransitionFade(
  duration: const Duration(seconds: 1),
  child: Icon(Icons.star),
)
```
