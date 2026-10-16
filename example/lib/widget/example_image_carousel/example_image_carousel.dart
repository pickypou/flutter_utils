import 'package:flutter/material.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// Interactive showcase displaying [ImageCarousel] with individual [CropConfig].
class ExampleImageCarousel extends StatelessWidget {
  /// Creates an [ExampleImageCarousel] showcase.
  const ExampleImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 720),
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
          child: ImageCarousel(
            imageUrl: const [
              'https://picsum.photos/id/1015/800/600',
              'https://picsum.photos/id/1016/800/600',
              'https://picsum.photos/id/1018/800/600',
            ],
            height: 240,
            fraction: 0.85,
            autoPlay: true,
            isFromAssets: false,
            cropConfigs: const [
              CropConfig(
                index: 1,
                widthFactor: 0.6,
                heightFactor: 0.6,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, size: 14, color: Color(0xFF38BDF8)),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                'Rognage automatique via CropConfig appliqué sur la 2e image sans déformer le ratio',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
