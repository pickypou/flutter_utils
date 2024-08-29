import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';


class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;
  final Duration duration;
  final Curve curve;
  final bool useFadeTransition;

  const ImageSlider({
    super.key,
    required this.imagePaths,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.easeInOut,
    this.useFadeTransition = true,
  });

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageChangeTimer();
  }

  void _startImageChangeTimer() {
    Future.delayed(widget.duration * 2, _changeImage);
  }

  void _changeImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.imagePaths.length;
    });
    _startImageChangeTimer();
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