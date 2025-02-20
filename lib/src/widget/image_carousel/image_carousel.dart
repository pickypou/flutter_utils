import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrl;
  final double height;
  final double fraction;
  final bool autoPlay;
  final bool isFromAssets;
  final Widget? animation;
  final int? cropImageIndex; // Index de l'image à recadrer
  final double? cropOffsetY; // Décalage vertical pour le recadrage
  final double? cropHeightFactor; // Facteur de hauteur pour le recadrage

  const ImageCarousel({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.fraction,
    required this.autoPlay,
    required this.isFromAssets,
    this.animation,
    this.cropImageIndex, // Paramètre optionnel pour l'index de l'image à recadrer
    this.cropOffsetY, // Paramètre optionnel pour le décalage vertical
    this.cropHeightFactor, // Paramètre optionnel pour le facteur de hauteur
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

          return Builder(builder: (BuildContext context) {
            // Appliquer un recadrage si l'index correspond à cropImageIndex
            if (cropImageIndex != null && index == cropImageIndex) {
              return Container(
                width: size.width * (isLandscape ? fraction : 1),
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: cropHeightFactor ?? 1.0, // Utiliser cropHeightFactor si fourni
                    child: Transform.translate(
                      offset: Offset(0, cropOffsetY ?? 0), // Utiliser cropOffsetY si fourni
                      child: isFromAssets
                          ? Image.asset(
                        url,
                        fit: BoxFit.cover,
                      )
                          : Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // Afficher les autres images normalement
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
            }
          });
        }).toList(),
      ),
    );
  }
}