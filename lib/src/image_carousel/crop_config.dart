import 'package:flutter/material.dart';

/// Configuration for cropping and aligning a specific image in [ImageCarousel].
class CropConfig {
  /// The index of the targeted image in the carousel.
  final int index;

  /// The alignment of the cropped image.
  final Alignment alignment;

  /// The horizontal crop factor (between 0.0 and 1.0).
  final double widthFactor;

  /// The vertical crop factor (between 0.0 and 1.0).
  final double heightFactor;

  /// Creates a [CropConfig] instance.
  const CropConfig({
    required this.index,
    this.alignment = Alignment.center,
    this.widthFactor = 1.0,
    this.heightFactor = 1.0,
  });
}
