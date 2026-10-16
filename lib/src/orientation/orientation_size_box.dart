import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// A widget that constrains its child's width based on the screen orientation.
class OrientationSizeBox extends StatelessWidget {
  /// The size reference (usually from `MediaQuery.sizeOf(context)`).
  final Size size;

  /// The child widget to display.
  final Widget? child;

  /// The fraction of the width to apply in landscape orientation.
  final double fraction;

  /// Creates an [OrientationSizeBox] widget.
  const OrientationSizeBox({
    super.key,
    required this.size,
    this.child,
    required this.fraction,
  });

  @override
  Widget build(BuildContext context) {
    bool fullHeight = size.orientation() == SizeOrientation.landscape;
    return SizedBox(
      width: size.width * (fullHeight ? fraction : 1),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: child,
      ),
    );
  }
}
