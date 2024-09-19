import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

class ExampleAnimation extends StatelessWidget {
  ExampleAnimation({
    super.key,
  });

  final List<String> images = [
    'assets/images/img3.png',
    'assets/images/img2.png'
    'assets/images/img1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Example d\'animation',
            style: ThemeConfig.textStyleText(context),
          ),
          const SizedBox(
            height: 35,
          ),
          ImageSlider(
            imagePaths: images,
            useFadeTransition: true,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          )
        ],
      ),
    );
  }
}
