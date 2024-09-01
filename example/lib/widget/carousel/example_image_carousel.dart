import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';


class ExampleImageCarousel extends StatelessWidget {
  const ExampleImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {

    return   SizedBox(
      child:  Center(

        child:
            ImagesCarousel(
              imageUrls: [
                "assets/images/img1.png",
                "assets/images/img2.png",
                "assets/images/img3.png"
              ]

            ),
      ),
    );
  }
}
