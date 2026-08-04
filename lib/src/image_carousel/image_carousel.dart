import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'crop_config.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrl;
  final double height;
  final double fraction;
  final bool autoPlay;
  final bool isFromAssets;
  final Widget? animation;
  final List<CropConfig> cropConfigs;

  const ImageCarousel({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.fraction,
    required this.autoPlay,
    required this.isFromAssets,
    this.animation,
    this.cropConfigs = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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