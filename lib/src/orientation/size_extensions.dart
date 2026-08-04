import 'package:flutter/material.dart';

/// Extension for adding custom utilities to the [Size] class.
extension MaterialSizeRatio on Size {
  /// Determines the orientation of the screen size.
  SizeOrientation orientation() {
    if (width > height) {
      return SizeOrientation.landscape;
    }
    if (height > width) {
      return SizeOrientation.portrait;
    }
    return SizeOrientation.square;
  }

  /// Returns the maximum value between width and height.
  double max() => (height > width) ? height : width;
}

/// Enum for different screen orientations.
enum SizeOrientation { portrait, landscape, square }
