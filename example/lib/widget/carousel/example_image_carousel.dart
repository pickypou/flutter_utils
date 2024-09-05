import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

import '../../models/hike.dart';


class ExampleImageCarousel extends StatelessWidget {
  final Hike hike;
  const ExampleImageCarousel({super.key, required this.hike});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hike.title, style: ThemeConfig.titleStyleMedium(context),),
          //Utilisation de imageCarousel avec une animation
          AnimatedOpacityFade(
              duration: const Duration(seconds: 2),
              child: ImageCarousel(
                  imageUrl: hike.imgUrls,
                  height: 200.0,
                  fraction: 3,
                  autoPlay: true,
              ),
          ),

          Padding(
              padding: const EdgeInsets.all(8.0),
          child: Text(hike.description, style: ThemeConfig.textStyleText(context),),
          )

        ],
      ),
    );
  }
}
