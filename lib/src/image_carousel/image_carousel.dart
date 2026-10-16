import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

/// An image carousel widget supporting asset and network images, auto-play, and per-image crop configurations.
class ImageCarousel extends StatelessWidget {
  /// The image URLs or asset paths to display.
  final List<String> imageUrl;

  /// The height of the carousel.
  final double height;

  /// The fraction of the viewport that each item occupies.
  final double fraction;

  /// Whether the carousel should automatically scroll.
  final bool autoPlay;

  /// Whether the images are loaded from assets or from the network.
  final bool isFromAssets;

  /// Optional widget to display in place of the image.
  final Widget? animation;

  /// Optional list of crop configurations for specific images by index.
  final List<CropConfig> cropConfigs;

  /// Creates an [ImageCarousel] widget.
  const ImageCarousel({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.fraction,
    required this.autoPlay,
    required this.isFromAssets,
    this.animation,
    this.cropConfigs = const [],
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final bool isLandscape = size.orientation() == SizeOrientation.landscape;

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

          final cropConfig = cropConfigs.firstWhere(
            (config) => config.index == index,
            orElse: () => CropConfig(index: index),
          );

          Widget imageWidget = isFromAssets
              ? Image.asset(
                  url,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: height,
                )
              : Image.network(
                  url,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: height,
                );

          if (cropConfig.widthFactor != 1.0 ||
              cropConfig.heightFactor != 1.0 ||
              cropConfig.alignment != Alignment.center) {
            imageWidget = ClipRect(
              child: Align(
                alignment: cropConfig.alignment,
                widthFactor: cropConfig.widthFactor,
                heightFactor: cropConfig.heightFactor,
                child: imageWidget,
              ),
            );
          }

          return Container(
            width: size.width * (isLandscape ? fraction : 1),
            height: height,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Center(
              child: animation ?? imageWidget,
            ),
          );
        }).toList(),
      ),
    );
  }
}
