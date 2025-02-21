import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'crop_config.dart'; // Importez CropConfig

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrl;
  final double height;
  final double fraction;
  final bool autoPlay;
  final bool isFromAssets;
  final Widget? animation;
  final List<CropConfig> cropConfigs; // Ajout des configurations de recadrage

  const ImageCarousel({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.fraction,
    required this.autoPlay,
    required this.isFromAssets,
    this.animation,
    this.cropConfigs = const [], // Liste vide par défaut
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final bool isLandscape = size.orientation() == SizeOrientation.paysage;

    return OrientationSizeBox(
      size: size,
      fraction: fraction,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: isLandscape ? fraction : 1.0,
          autoPlay: autoPlay,
        ),
        items: imageUrl.asMap().entries.map((entry) {
          final int index = entry.key;
          final String url = entry.value;

          // Appliquer un recadrage si une configuration existe pour cette image
          final cropConfig = cropConfigs.firstWhere(
                (config) => config.index == index,
            orElse: () => CropConfig(index: -1),
          );

          return Container(
            width: size.width * (isLandscape ? fraction : 1),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ClipRect(
              child: Transform.translate(
                offset: Offset(0, cropConfig.offsetY),
                child: animation ??
                    (isFromAssets
                        ? Image.asset(
                      url,
                      fit: BoxFit.cover,
                    )
                        : Image.network(
                      url,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}