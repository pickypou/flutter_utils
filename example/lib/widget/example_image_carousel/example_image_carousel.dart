import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleImageCarousel extends StatelessWidget {
  const ExampleImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Exemple ImageCarousel avec CropConfig',
          style: ThemeConfig.titleStyleMedium(context),
        ),
        const SizedBox(height: 20),
        ImageCarousel(
          // Utilisation d'URL factices pour la démonstration
          imageUrl: const [
            'https://picsum.photos/id/1015/800/600',
            'https://picsum.photos/id/1016/800/600',
            'https://picsum.photos/id/1018/800/600',
          ],
          height: 250,
          fraction: 0.8,
          autoPlay: true,
          isFromAssets: false,
          // Appliquons un rognage (crop) uniquement sur la 2ème image (index 1)
          cropConfigs: const [
            CropConfig(
              index: 1,
              widthFactor: 0.5,
              heightFactor: 0.5,
              alignment: Alignment.bottomRight, // Rognage en bas à droite
            ),
          ],
        ),
      ],
    );
  }
}
