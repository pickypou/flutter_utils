import 'package:carousel_slider/carousel_slider.dart';

import 'crop_config.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrl;
  final List<CropConfig> cropConfigs;
  final Duration autoPlayInterval;
  final Color indicatorColor;
  final ValueChanged<int>? onPageChanged;
  final GestureTapCallback? onImageTap;

  const ImageCarousel({
    super.key,
    required this.imageUrl,
    this.cropConfigs = const [],
    this.autoPlayInterval = const Duration(seconds: 3),
    this.indicatorColor = Colors.white,
    this.onPageChanged,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: autoPlayInterval,
        onPageChanged: (index, reason) {
          if (onPageChanged != null) {
            onPageChanged!(index);
          }
        },
      ),
      items: imageUrl.asMap().entries.map((entry) {
        final int index = entry.key;
        final String url = entry.value;

        // Appliquer un recadrage si une configuration existe pour cette image
        final cropConfig = cropConfigs.firstWhere(
              (config) => config.index == index,
          orElse: () => CropConfig(index: -1),
        );

        return GestureDetector(
          onTap: onImageTap,
          child: cropConfig.index != -1
              ? ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: cropConfig.heightFactor,
              child: Transform.translate(
                offset: Offset(0, cropConfig.offsetY),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              : Image.network(
            url,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }
}