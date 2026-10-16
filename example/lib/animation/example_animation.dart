import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// Interactive showcase displaying [ImageSlider] and [AnimatedOpacityFade].
class ExampleAnimation extends StatefulWidget {
  /// Creates an [ExampleAnimation] showcase.
  const ExampleAnimation({super.key});

  @override
  State<ExampleAnimation> createState() => _ExampleAnimationState();
}

class _ExampleAnimationState extends State<ExampleAnimation> {
  final List<String> images = const [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
  ];

  Key _fadeKey = UniqueKey();

  void _replayFade() {
    setState(() {
      _fadeKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ImageSlider
        Container(
          constraints: const BoxConstraints(maxWidth: 420),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: ImageSlider(
            imagePaths: images,
            useFadeTransition: true,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          ),
        ),
        const SizedBox(height: 24),

        // AnimatedOpacityFade with replay action
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: AnimatedOpacityFade(
                key: _fadeKey,
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeOut,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome,
                        color: Color(0xFFA855F7), size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Texte animé avec AnimatedOpacityFade',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              tooltip: 'Rejouer l\'animation de fondu',
              icon: const Icon(Icons.refresh, color: Color(0xFF818CF8)),
              onPressed: _replayFade,
            ),
          ],
        ),
      ],
    );
  }
}
