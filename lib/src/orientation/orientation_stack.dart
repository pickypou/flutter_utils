import 'package:flutter/material.dart';

import '../../flutter_kit_utils.dart';

/// A responsive layout widget that arranges its children in a [Row] when in landscape orientation
/// and in a [Column] when in portrait orientation.
class OrientationStack extends StatelessWidget {
  /// The current orientation state.
  final SizeOrientation orientation;

  /// The list of widgets to lay out.
  final List<Widget> children;

  /// Creates an [OrientationStack] widget.
  const OrientationStack({
    super.key,
    required this.orientation,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    if ((orientation == SizeOrientation.landscape)) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      return Column(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      );
    }
  }
}
