import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'crop_config.dart'; // Importez CropConfig

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls; // Liste des URLs ou chemins d'assets
  final List<CropConfig> cropConfigs; // Configurations de recadrage
  final double height; // Hauteur du carrousel
  final double viewportFraction; // Fraction de la vue pour chaque image
  final bool autoPlay; // Lecture automatique
  final bool isFromAssets; // True pour les assets, false pour les URLs
  final Duration autoPlayInterval; // Intervalle de lecture automatique
  final Color indicatorColor; // Couleur des indicateurs
  final ValueChanged<int>? onPageChanged; // Callback pour le changement de page
  final GestureTapCallback? onImageTap; // Callback pour le clic sur une image

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    this.cropConfigs = const [],
    this.height = 200,
    this.viewportFraction = 1.0,
    this.autoPlay = true,
    this.isFromAssets = false,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.indicatorColor = Colors.white,
    this.onPageChanged,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height, // Hauteur du carrousel
            viewportFraction: viewportFraction, // Largeur de chaque image
            autoPlay: autoPlay, // Lecture automatique
            autoPlayInterval: autoPlayInterval, // Intervalle de lecture
            onPageChanged: (index, reason) {
              if (onPageChanged != null) {
                onPageChanged!(index); // Callback pour le changement de page
              }
            },
          ),
          items: imageUrls.asMap().entries.map((entry) {
            final int index = entry.key;
            final String url = entry.value;

            // Appliquer un recadrage si une configuration existe pour cette image
            final cropConfig = cropConfigs.firstWhere(
                  (config) => config.index == index,
              orElse: () => CropConfig(index: -1),
            );

            return Container(
              height: height, // Fixer la hauteur du conteneur
              child: GestureDetector(
                onTap: onImageTap, // Callback pour le clic sur une image
                child: cropConfig.index != -1
                    ? ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: cropConfig.heightFactor,
                    child: Transform.translate(
                      offset: Offset(0, cropConfig.offsetY),
                      child: isFromAssets
                          ? Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                          : Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
                    : isFromAssets
                    ? Image.asset(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
                    : Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          }).toList(),
        ),
        // Indicateurs (optionnel)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.asMap().entries.map((entry) {
            final int index = entry.key;
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: indicatorColor.withOpacity(
                  index == 0 ? 1.0 : 0.4, // Mettez en surbrillance l'indicateur actuel
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}