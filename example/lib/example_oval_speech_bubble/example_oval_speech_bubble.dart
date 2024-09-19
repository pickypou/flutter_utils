import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';


class ExampleOvalSpeechBubble extends StatelessWidget {
  const ExampleOvalSpeechBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: OvalSpeechBubble(
        text: "Je suis là pour vous aider à retrouver équilibre, relaxation & bien-être.\n\nQue vous souffriez de maux physiques ou émotionnels",
        borderColor: Color(0xFF8E44AD),
        borderWidth: 2.0,
        bubbleWidth: 300,
        bubbleHeight: 200,
        pointPosition: PointPosition.left,
      ),
    );
  }
}
