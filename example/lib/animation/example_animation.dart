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
    'https://picsum.photos/id/1015/800/600',
    'https://picsum.photos/id/1016/800/600',
    'https://picsum.photos/id/1018/800/600',
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
        // Section A: ImageSlider
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.slideshow, color: Color(0xFF38BDF8), size: 20),
            SizedBox(width: 8),
            Text(
              'Défilement automatique (ImageSlider)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          constraints: const BoxConstraints(maxWidth: 420),
          height: 220,
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
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
          ),
        ),
        const SizedBox(height: 32),

        // Section B: AnimatedOpacityFade with landscape photo and replay button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.blur_on, color: Color(0xFFA855F7), size: 20),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                'Fondu progressif d\'image (AnimatedOpacityFade)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Rejouer l\'animation de fondu',
              icon: const Icon(Icons.refresh, color: Color(0xFF818CF8)),
              onPressed: _replayFade,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          constraints: const BoxConstraints(maxWidth: 420),
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: AnimatedOpacityFade(
            key: _fadeKey,
            duration: const Duration(milliseconds: 1800),
            curve: Curves.easeInOut,
            child: Image.network(
              'https://picsum.photos/id/1018/800/600',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
