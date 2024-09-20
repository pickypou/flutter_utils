import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';


class ExampleSvgCustomPainter extends StatelessWidget {
  const ExampleSvgCustomPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 900,
        height: 500,
        child: CustomPaint(
          painter: SvgCustomPainter(
            config: BubbleConfig(
              borderColor: theme.colorScheme.secondary,
              fillColor: Colors.transparent,
              text: "\"Je suis là pour vous aider à retrouver équilibre, relaxation & bien-être. Que vous souffriez de maux physiques ou émotionnels\"",
              textStyle: textStyleText(context),
              width: 900,
              height: 500,
            ),
          ),
        ),
      ),
    );
  }
}
