import 'package:flutter/material.dart';
import 'package:flutter_utils/src/bubble/speech_bubble.dart';

class SpeechBubbleWidget extends StatelessWidget {
  final String text;

  const SpeechBubbleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpeechBubble(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
