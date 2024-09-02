import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleAnimation extends StatelessWidget {
  ExampleAnimation({
    super.key,
  });

  final List<String> images = [
    'assets/images/img3.png',
    'assets/images/img2.png',
        'assets/images/img1.png',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Example d\'animation',
            style: ThemeConfig.textStyleText(context),
          ),
           SizedBox(
            width: size.width,
            height: 235,
          child:
          ImageSlider(
            imagePaths: images,
            useFadeTransition: true,
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
          )
          ),
        ],
      ),
    );
  }
}
