import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Assurez-vous d'importer le package carousel_slider

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  // Le constructeur utilise un paramètre nommé
  const ImageCarousel({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4, // Hauteur du carousel (40% de la hauteur de l'écran)
        autoPlay: true,
        aspectRatio: 4/3, // Ratio pour l'aspect du carousel
        enlargeCenterPage: true,
        viewportFraction: 0.2, // Ajuste la largeur du carousel
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
