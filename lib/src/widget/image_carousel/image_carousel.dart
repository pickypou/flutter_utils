import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrl;
  final double height;
  final double fraction;
  final bool autoPlay;
  final bool isFromAssets;  // Nouveau paramètre pour différencier les images
  final Widget? animation;

  // Le constructeur utilise un paramètre nommé
  const ImageCarousel({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.fraction,
    required this.autoPlay,
    required this.isFromAssets,  // Paramètre requis pour indiquer la source des images
    this.animation,
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
        items: imageUrl.map((url) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: size.width * (isLandscape ? fraction : 1),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
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
            );
          });
        }).toList(),
      ),
    );
  }
}
