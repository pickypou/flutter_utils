import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import '../../theme.dart';

class BulleDialogue extends StatelessWidget {
  const BulleDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 4,
      height: 700,
      child: CustomPaint(
        painter: SvgCustomPainter(
          config: BubbleConfig(
            borderColor: theme.colorScheme.secondary,
            fillColor: Colors.transparent,
            text: '\"je suis là pour vous aider à retrouver équilibre, relaxation & bien-être. Que vous souffriez de maux physiques ou émotionnels\"',
            textStyle: textStyleTextAccueil(context), // Utilisez votre style de texte ici
            width: size.width / 4,
            height: 700,
          ),
        ),
      ),
    );
  }
}
