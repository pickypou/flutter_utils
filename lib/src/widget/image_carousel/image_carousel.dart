import 'package:flutter/material.dart';


class ImagesCarousel extends StatelessWidget {
  final List<String> imagePaths;//Les chemins des images à afficher
  final double spacing; //L'espacement entre chaque image
  final double imageHeight;// hauter des l'images
  final double imageWidth;// Largeur des images
  final Duration duration;//Durée de l'animation de défilement

  const ImagesCarousel({
    super.key,
    required this.imagePaths,
    required this.spacing,
    required this.imageHeight,
    required this.imageWidth,
    required this.duration
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
          imagePaths.map((path){
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  path,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
      ),
    );
  }
}
