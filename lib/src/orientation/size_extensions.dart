import 'package:flutter/material.dart';

/// Extension for adding custom utilities to the [Size] class.
extension MaterialSizeRatio on Size {
  /// Determines the orientation of the screen size.
  SizeOrientation orientation() {
    if (width > height) {
      return SizeOrientation.paysage;
    }
    if (height > width) {
      return SizeOrientation.portrait;
    }
    return SizeOrientation.carre;
  }

  /// Returns the maximum value between width and height.
  double max() => (height > width) ? height : width;

  /// Returns the height for the header based on the screen orientation.
  double headerHeight() {
    switch (orientation()) {
      case SizeOrientation.portrait:
        return height * .5;
      case SizeOrientation.paysage:
        return height * .7;
      default:
        return height * .5;
    }
  }

  /// Returns the remaining height after subtracting the header height.
  double newsHeight() => height - headerHeight();
}

/// Enum for different screen orientations.
enum SizeOrientation { portrait, paysage, carre }
