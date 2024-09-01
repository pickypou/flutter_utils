import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';


class ExampleImageCarousel extends StatelessWidget {
  const ExampleImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    //Liste d'images à afficher dans le carousel
    final List<String> images = [
      'assets/images/img1.png',
      'assets/images/img2.png',
      'assets/images/img3.png'
    ];
    return  const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
