import 'package:flutter/material.dart';

import '../../flutter_utils.dart';

class OrientationStack extends StatelessWidget {
  final SizeOrientation orientation;
  final List<Widget> children;
  const OrientationStack(
      {super.key, required this.orientation, required this.children});

  @override
  Widget build(BuildContext context) {
    if ((orientation == SizeOrientation.paysage)) {
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
