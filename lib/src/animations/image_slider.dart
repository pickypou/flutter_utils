import 'package:flutter/material.dart';

import '../../flutter_utils.dart';


class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final Duration duration;
  final Curve curve;
  final bool useFadeTransition;

  const ImageSlider({
    Key? key,
    required this.imagePaths,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
    this.useFadeTransition = true,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isFirstImage = true;

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  void _startImageChangeTimer() {
    Future.delayed(widget.duration, _changeImage);
  }

  void _changeImage() {
    setState(() {
      _isFirstImage = !_isFirstImage;
      _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
    });

    _startImageChangeTimer(); // Redémarre le timer pour changer l'image régulièrement
  }

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image.asset(
      widget.imagePaths[_currentIndex],
      fit: BoxFit.cover,
    );

    return widget.useFadeTransition
        ? FadeTransitionFade(
      duration: widget.duration,
      curve: widget.curve,
      child: imageWidget,
    )
        : AnimatedOpacityFade(
      duration: widget.duration,
      curve: widget.curve,
      child: imageWidget,
    );
  }
}